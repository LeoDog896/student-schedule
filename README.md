# student-schedule

Easy flex block manager for students, teachers, and administrators.

## Database

We use [SurrealDB](https://surrealdb.com/) for our database. To debug it, feel free to use [surrealist](https://surrealist.app/).

### Quick Start

Start up the web server:

```sh
yarn dev
```

Start up the database:

```sh
surreal start memory --auth --user root --pass root
surreal import --conn http://localhost:8000 --user root --pass root --ns schedule --db schedule src/lib/db.surql
```
