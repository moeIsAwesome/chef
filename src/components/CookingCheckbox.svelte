<script lang="ts">
	import { Checkbox, Label } from 'flowbite-svelte';

	export let instruction: any;
</script>

<div class="bg-white rounded p-3 h-fit">
	{#each instruction as bearDoughCookingCheckbox, index}
		{#key bearDoughCookingCheckbox}
			<div
				class="flex justify-between border-b-2 border-blue-100 py-2"
				class:line-through={bearDoughCookingCheckbox.isChecked}
				class:text-red-600={bearDoughCookingCheckbox.isChecked}
			>
				<Label class="px-2" for={bearDoughCookingCheckbox.name}
					>{index + 1}. {bearDoughCookingCheckbox.instruction}</Label
				>
				<Checkbox
					id={bearDoughCookingCheckbox.name}
					bind:disabled={bearDoughCookingCheckbox.isDisabled}
					bind:checked={bearDoughCookingCheckbox.isChecked}
					on:click={() => {
						if (instruction[index].isChecked === false && index !== instruction.length - 1) {
							instruction[index].isChecked = !instruction[index].isChecked;
							instruction[index + 1].isDisabled = !instruction[index + 1].isDisabled;
							for (let i = 0; i < index; i++) {
								instruction[i].isDisabled = !instruction[index].isDisabled;
							}
						} else if (index !== 0) {
							instruction[index].isChecked = !instruction[index].isChecked;
							instruction[index - 1].isDisabled = !instruction[index - 1].isDisabled;
							for (let i = index + 1; i < instruction.length; i++) {
								instruction[i].isDisabled = !instruction[index].isDisabled;
							}
						} else if (index === 0) {
							instruction[index].isChecked = !instruction[index].isChecked;
							for (let i = index + 1; i < instruction.length; i++) {
								instruction[i].isDisabled = !instruction[index].isDisabled;
							}
						} else if (index === instruction.length - 1) {
							instruction[index].isChecked = !instruction[index].isChecked;
						}
					}}
				/>
			</div>
		{/key}
	{/each}
</div>
