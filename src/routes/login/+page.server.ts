import { fail } from '@sveltejs/kit';
import * as db from '$lib/server/database.js';
import type { Actions } from './$types';

export function load({ cookies }) {
	const id = cookies.get('userid');

	if (!id) {
		cookies.set('userid', crypto.randomUUID(), { path: '/' });
	}

	return {
		todos: db.getTodos(id) ?? []
	};
}

export const actions: Actions = {
	signin: async ({ cookies, request }) => {
		const data = await request.formData();
		const username = data.get("email");
		const password = data.get("password");
	}
};
