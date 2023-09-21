import { Surreal } from 'surrealdb.js';
import type { ActionResult } from 'surrealdb.js/script/types';

const db = new Surreal();

async function main() {
    if (!globalThis.window) return
    await db.connect('http://127.0.0.1:8000/rpc', {
        ns: 'schedule',
        db: 'schedule',
    });
}

type Organization = {
    name: string;
}

export async function getOrganizations(): Promise<ActionResult<Organization>[]> {
    await main();
    const result = await db.select<Organization>('organization');

    return result;
}

main();
