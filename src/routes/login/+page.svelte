<script lang="ts">
	import { getOrganizations } from '$lib/database/client';

	let organizations = getOrganizations();
</script>

{#await organizations}
	<p>loading...</p>
{:then awaitedOrganizations}
	{#if awaitedOrganizations}
		{#each awaitedOrganizations as organization}
			<p>{organization.name}</p>
		{/each}
	{/if}
{:catch error}
	<p>{error.message}</p>
{/await}
