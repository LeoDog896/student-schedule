import { Surreal } from 'surrealdb.js';

const db = new Surreal();

async function main() {
    if (!globalThis.window) return
    await db.connect('http://127.0.0.1:8000/rpc', {
        ns: 'schedule',
        db: 'schedule',
    });
}

export async function getOrganizations(): Promise<Record<string, string>[]> {
    await main();
    const { result } = (await db.query('SELECT * FROM organization'))[0];

    return result as Record<string, string>[];
}

main();
