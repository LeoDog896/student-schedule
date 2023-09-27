import { error } from '@sveltejs/kit';
import type { PageLoad } from './$types';
import { getOrganization } from '$lib/database/client';

export const load: PageLoad = async ({ params }) => {
    const organization = await getOrganization(params.slug);
    if (organization) {
        return {
            ...organization
        }
    }
    return error(404, 'Organization not found');
}