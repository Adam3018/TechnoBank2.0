## TechnoBank 2.0 ##

Cloning the Project

Since this project uses Git submodules, clone it using:

``` bash
git clone --recurse-submodules https://github.com/Adam3018/TechnoBank2.0.git
```

or (SSH)

``` bash
git clone --recurse-submodules git@github.com:Adam3018/TechnoBank2.0.git
```

This clones:

the root repository
the backend (technobank-api)
the frontend (technobank-ui)

If You Forgot --recurse-submodules

Run:
``` bash
git submodule update --init --recursive
```

Pulling all submodules:
```bash
git submodule foreach git pull
```