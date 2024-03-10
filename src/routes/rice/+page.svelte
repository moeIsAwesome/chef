<script lang="ts">
	import { Button, Input, Label } from 'flowbite-svelte';
	import Rice from '../../../src/icons/rice.png';
	import Oil from '../../../src/icons/oil.png';
	import Salt from '../../../src/icons/salt.png';
	import Water from '../../../src/icons/water.png';
	import Ingredient from '../../components/Ingredient.svelte';
	let rice: number = 0;
	$: water = rice * 1.66;
	$: salt = rice / 333;
	$: oil = rice / 333;
</script>

<div
	class="h-full bg-slate-300 flex justify-center items-center flex-col overflow-hidden space-y-8"
>
	<div class="text-center">
		<div class="md:text-3xl text-2xl font-bold text-orange-500"><h1>Rice!</h1></div>
	</div>
	<div class="flex flex-col space-y-5 md:space-y-6 w-full md:w-[45%] md:px-4 px-4">
		<div class="border-b-2 flex flex-col items-center border-black">
			<div class="flex w-full justify-between space-x-3">
				<div class="flex items-center">
					<Label for="flour" class="text-xl font-semibold md:text-2xl mr-2">Rice:</Label>
					<div class="flex space-x-2">
						<Input type="number" id="flour" placeholder="1000" bind:value={rice} class="w-24" />
						<span class="text-2xl">g</span>
					</div>
				</div>

				<img src={Rice} alt="Rice" height="64" width="64" />
			</div>
			<div class="py-4 md:space-x-2">
				{#each [250, 500, 750, 1000] as amount}
					<Button
						color="alternative"
						class="focus:ring-2 focus:ring-orange-500"
						on:click={() => {
							rice = amount;
						}}
					>
						{amount}g
					</Button>
				{/each}
			</div>
		</div>
		<Ingredient name="Water" icon={Water} iconAlt="Water" unit="mL" value={water} />
		<Ingredient name="Salt" icon={Salt} iconAlt="Salt" unit="tsp" value={salt} decimals={1} />
		<Ingredient name="Oil" icon={Oil} iconAlt="Oil" unit="tbsp" value={oil} decimals={1} />
	</div>
</div>
