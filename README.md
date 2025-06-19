# 🗄️ Backup Manager (Shell Script)

This is a Bash-based **Backup Manager** script that automates the backup of files and directories into timestamped folders. It includes logging, dry-run mode, and automatic cleanup of old backups.

---

## 📁 Project Structure

Backup_manager/
├── backup.sh # Main backup script
├── cron_test.sh # Simulates cron execution
├── backups/ # Directory where backups are stored
├── logs/ # Directory for log files
├── .gitignore # Git ignore rules for logs and backups
└── README.md # Project documentation

yaml
Copy
Edit

---

## 🚀 Features

- 📦 Backup specific files or folders
- 🕒 Timestamped folders for each backup
- 🧪 Dry-run mode (`--dry-run`) to preview without execution
- 🪵 Logging to `logs/backup.log`
- 🧹 Deletes backups older than 7 days automatically
- ⏱️ Supports cron scheduling for automation

---

## 🧪 Usage

### Dry-run (preview only):
```bash
./backup.sh --dry-run ~/Documents ~/Pictures
