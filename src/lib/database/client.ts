import { Surreal } from 'surrealdb.js';
import type { ActionResult } from 'surrealdb.js/script/types';
import { browser } from '$app/environment';

const url = 'http://127.0.0.1:8000/';
const rpc = url + 'rpc';

const db = new Surreal();

async function hookToAPI() {
	if (!browser) {
		await db.signin({
			NS: 'schedule',
			DB: 'schedule',
			SC: 'api',
			description: 'webpage',
			password: 'password'
		});
	}
}

async function connect() {
	await db.connect(rpc, {
		ns: 'schedule',
		db: 'schedule'
	});

	await hookToAPI();
}

export async function signin(email: string, password: string): Promise<string | undefined> {
	await ready();
	if (browser) {
		return await db.signin({
			NS: 'schedule',
			DB: 'schedule',
			SC: 'user',
			email,
			password
		});
	} else {
		await fetch(url + 'signin', {});
	}
}

async function ready() {
	await db.ready;
}

type Organization = {
	name: string;
	slug: string;
	signupType: 'password' | 'classlink';
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
