#!/bin/bash

BACKUP_DIR="./backups"
LOG_FILE="./logs/backup.log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
DRY_RUN=false
RETENTION_DAYS=7

# Usage function
usage() {
  echo "Usage: $0 [--dry-run] <file_or_directory1> <file_or_directory2> ..."
  exit 1
}

# Parse arguments
TARGETS=()
for arg in "$@"; do
  if [[ "$arg" == "--dry-run" ]]; then
    DRY_RUN=true
  else
    TARGETS+=("$arg")
  fi
done

if [ ${#TARGETS[@]} -eq 0 ]; then
  usage
fi

BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"
mkdir -p "$BACKUP_PATH"

log() {
  echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" | tee -a "$LOG_FILE"
}

log "Backup started. Dry-run: $DRY_RUN"
log "Creating backup folder: $BACKUP_PATH"

for target in "${TARGETS[@]}"; do
  if [ -e "$target" ]; then
    if [ "$DRY_RUN" = true ]; then
      log "[DRY RUN] Would copy '$target' to '$BACKUP_PATH'"
    else
      cp -r "$target" "$BACKUP_PATH"
      log "Copied '$target' to '$BACKUP_PATH'"
    fi
  else
    log "Warning: '$target' does not exist"
  fi
done

# Cleanup old backups
log "Cleaning backups older than $RETENTION_DAYS days"
find "$BACKUP_DIR" -maxdepth 1 -type d -name "backup_*" -mtime +$RETENTION_DAYS -exec rm -rf {} \; -exec echo "Deleted {}" >> "$LOG_FILE" \;

log "Backup completed"
