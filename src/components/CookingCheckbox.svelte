<script lang="ts">
	import { Checkbox, Label } from 'flowbite-svelte';
	export let instruction: string;
	export let name: string;
	export let isDisabled: boolean = true;

	export let removeDisableFromTheOther: () => void;
</script>

<div class="flex justify-between border-b-2 py-1">
	<Label class="px-2" for={name}>{instruction}</Label>
	<Checkbox id={name} bind:disabled={isDisabled} on:change={removeDisableFromTheOther} />
</div>
<!-- add isDisabled conditionally -->
