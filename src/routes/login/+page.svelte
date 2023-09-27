<script lang="ts">
	import { getOrganizations } from '$lib/database/client';

	let organizations = getOrganizations();
</script>

<main>
	<h1>Schools</h1>

	{#await organizations}
		<p>loading...</p>
	{:then awaitedOrganizations}
		{#if awaitedOrganizations}
			{#each awaitedOrganizations as organization}
				<a href={`/login/${organization.slug}`}>{organization.name}</a>
			{/each}
		{/if}
	{:catch error}
		<p>{error.message}</p>
	{/await}
</main>

<style>
	main {
		max-width: 800px;
		margin: 0 auto;
	}

	a {
		display: block;
		width: 100%;
		padding: 1rem;
		margin: 0.5rem 0;
		border: none;
		border-radius: 0.5rem;
		background: var(--blue);
		color: var(--textLight);
		font-size: 1.5rem;
		font-weight: 600;
		cursor: pointer;
		text-align: center;
		text-decoration: none;
	}

	a:hover {
		background: var(--blueHover);
	}

	a:active {
		background: var(--blueActive);
	}
</style>
