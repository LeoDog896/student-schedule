<script lang="ts">
	import type { PageData } from './$types';
	export let data: PageData;
</script>

<main>
	<h1>{data.name} Portal</h1>
	{#if data.signupType == "classlink"}
		<p>Login with ClassLink</p>
	{:else if data.signupType == "password"}
		<form class="login">
			<label for="username">Username</label>
			<input type="text" id="username" name="username" />
			<label for="password">Password</label>
			<input type="password" id="password" name="password" />
			<button>Login</button>
		</form>
	{/if}
</main>

<style>
	main {
		margin: 0 auto;
		max-width: 20rem;
		text-align: center;
	}

	.login {
		display: flex;
		flex-direction: column;
		width: 100%;
	}

	.login > * {
		margin: 0.5rem;
	}

	.login > input {
		width: 100%;
	}

	.login > label {
		text-align: left;
	}

	.login > button {
		width: 100%;
	}
</style>