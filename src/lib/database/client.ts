import { Surreal } from 'surrealdb.js';
import type { ActionResult } from 'surrealdb.js/script/types';

const db = new Surreal();

async function main() {
	await db.connect('http://127.0.0.1:8000/rpc', {
		ns: 'schedule',
		db: 'schedule'
	});
}

type Organization = {
	name: string;
	slug: string;
};

export async function getOrganizations(): Promise<ActionResult<Organization>[]> {
	await main();
	const result = await db.select<Organization>('organization');

	return result;
}

export async function getOrganization(slug: string): Promise<Organization | undefined> {
	await main();
	const result = await db.query("SELECT * FROM organization WHERE slug = $slug", { slug });

	return result[0].result as Organization | undefined;
}

main();
