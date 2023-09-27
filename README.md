# student-schedule

Easy flex block manager for students, teachers, and administrators.

## Database

We use [SurrealDB](https://surrealdb.com/) for our database. To debug it, feel free to use [surrealist](https://surrealist.app/).

We require the `--allow-guests` capability to serve some of our public endpoints.

### Quick Start

Start up the web server:

```sh
yarn dev
```

Start up the database:

```sh
surreal start memory --allow-guests --auth --user root --pass root
surreal import --conn http://localhost:8000 --user root --pass root --ns schedule --db schedule src/lib/db.surql
```

If you're in a dev environment, make sure to also run:

```sh
surreal import --conn http://localhost:8000 --user root --pass root --ns schedule --db schedule src/lib/test.surql
```
