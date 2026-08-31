# TechnoBank 2.0

Full-stack banking demo app: FastAPI backend + React frontend.

## Cloning the Project

This project uses Git submodules, so clone it with:

```bash
git clone --recurse-submodules https://github.com/Adam3018/TechnoBank2.0.git
```

or via SSH:

```bash
git clone --recurse-submodules git@github.com:Adam3018/TechnoBank2.0.git
```

This pulls down:
- the root repository
- the backend (`technobank-api`)
- the frontend (`technobank-ui`)

### If you forgot `--recurse-submodules`

```bash
git submodule update --init --recursive
```

### Pulling updates for all submodules

```bash
git submodule foreach git pull
```

## Quick Start

### Windows

```cmd
run.bat
```

This opens two windows (API + UI) and launches the app at `http://localhost:5173`.

### Linux / macOS

```bash
chmod +x run.sh run-api.sh run-ui.sh
./run.sh
```

This starts the API and UI (in separate terminal windows if available, otherwise in the background with logs in `api.log` / `ui.log`) and opens `http://localhost:5173`.

You can also start each service on its own:

```bash
./run-api.sh   # backend only
./run-ui.sh    # frontend only
```

## Backend Setup (technobank-api)

### First-time setup

Run the setup script for your OS, or set it up manually.

**Windows:**
```cmd
cd technobank-api
setup.bat
```

**Linux / macOS:**
```bash
cd technobank-api
chmod +x setup.sh
./setup.sh
```

### Manual setup

1. Create a virtual environment:
```bash
python3 -m venv venv
```

2. Activate it:
   - Windows: `venv\Scripts\activate`
   - macOS/Linux: `source venv/bin/activate`

3. Install dependencies:
```bash
pip install -r requirements.txt
```

### Running the API directly

```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

Available at `http://localhost:8000`.

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

### Database

Uses SQLite by default. The database file (`TechnoBankHermes.db`) is created automatically on first run.

To use a different database:
1. Update `SQLALCHEMY_DATABASE_URL` in `app/database.py`
2. Install the matching database driver

### Backend Dependencies

- **FastAPI** – web framework
- **Uvicorn** – ASGI server
- **SQLAlchemy** – ORM
- **Pydantic** – data validation
- **pandas** – data handling
- **rapidfuzz** – fuzzy string matching

## Frontend Setup (technobank-ui)

```bash
cd technobank-ui
npm install
npm run dev
```

Available at `http://localhost:5173`.

## Troubleshooting

- **`ModuleNotFoundError: No module named 'app'`** — make sure you're running uvicorn from inside `technobank-api`, not the project root.
- **Virtual environment not found** — run the setup script, or create it manually with `python3 -m venv venv` inside `technobank-api`.
- **PowerShell blocks `Activate.ps1`** — run once as admin:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
- **`node_modules` missing** — run `npm install` inside `technobank-ui`.

## License

MIT License – free to use for learning and development.

## Contributing

Contributions are welcome. Please follow PEP 8 for Python code and keep test coverage up.
