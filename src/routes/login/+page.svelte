<script lang="ts">
</script>

<svelte:head>
	<title>Login Portal</title>
</svelte:head>

<main>
	<h1>Login Portal</h1>
	<p>Login with ClassLink</p>
	<p><b>OR</b></p>
	<p>Login with Email and Password</p>
	<form class="login">
		<label for="email">Email</label>
		<input type="text" id="username" name="username" />
		<label for="password">Password</label>
		<input type="password" id="password" name="password" />
		<button>Login</button>
	</form>
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