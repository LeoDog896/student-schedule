import { Surreal } from 'surrealdb.js';
import type { ActionResult } from 'surrealdb.js/script/types';

const db = new Surreal();

async function connect() {
	await db.connect('http://127.0.0.1:8000/rpc', {
		ns: 'schedule',
		db: 'schedule'
	});
}

async function ready() {
	await db.ready;
}

type Organization = {
	name: string;
	slug: string;
	signupType: "password" | "classlink";
};

export async function getOrganizations(): Promise<ActionResult<Organization>[]> {
	await ready();
	const result = await db.select<Organization>('organization');

	return result;
}

export async function getOrganization(slug: string): Promise<Organization | undefined> {
	await ready();
	const [result] = await db.query('SELECT * FROM organization WHERE slug = $slug', { slug });

	if (!result.result) return undefined;
	if (!Array.isArray(result.result)) return undefined;

	return result.result[0] as Organization | undefined;
}

connect();
