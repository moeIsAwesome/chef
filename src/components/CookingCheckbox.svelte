<script lang="ts">
	import { Checkbox, Label } from 'flowbite-svelte';
	export let instruction: string;
	export let name: string;
	export let isDisabled: boolean;
	export let isChecked: boolean;
	export let func: any;
</script>

{#key isDisabled}
	<div class="flex justify-between border-b-2 py-1" class:line-through={isChecked}>
		<Label class="px-2" for={name}>{instruction}</Label>
		<Checkbox id={name} bind:disabled={isDisabled} on:change={func} bind:checked={isChecked} />
	</div>
{/key}
