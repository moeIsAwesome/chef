<script lang="ts">
	import { Label, Input, Button } from 'flowbite-svelte';
	import Ingredient from '../../components/Ingredient.svelte';

	import MincedMeat from '../../../src/icons/mincedMeat.png';
	import Onion from '../../../src/icons/onion.png';
	import Garlic from '../../../src/icons/garlic.png';
	import Salt from '../../../src/icons/salt.png';

	let mincedMeat: number = 0;
	$: onion = mincedMeat * 0.35;
	$: garlic = mincedMeat / 200;
	$: salt = mincedMeat / 550;
</script>

<div
	class="h-full bg-slate-300 flex justify-center items-center flex-col overflow-hidden space-y-8"
>
	<div class="text-center">
		<div class="md:text-3xl text-2xl font-bold text-orange-500"><h1>Kebap!</h1></div>
	</div>
	<div class="flex flex-col space-y-5 md:space-y-6 w-full md:w-[45%] md:px-4 px-4">
		<div class="border-b-2 flex flex-col items-center border-orange-500">
			<div class="flex w-full justify-between space-x-3">
				<div class="flex items-center">
					<Label for="flour" class="text-xl font-semibold md:text-2xl mr-2">Meat:</Label>
					<div class="flex space-x-2">
						<Input
							type="number"
							id="flour"
							placeholder="1000"
							bind:value={mincedMeat}
							class="w-24"
						/>
						<span class="text-2xl">g</span>
					</div>
				</div>

				<img src={MincedMeat} alt="Rice" height="64" width="64" />
			</div>
			<div class="py-4 md:space-x-2">
				{#each [250, 500, 750, 1000] as amount}
					<Button
						color="alternative"
						class="focus:ring-2 focus:ring-orange-500"
						on:click={() => {
							mincedMeat = amount;
						}}
					>
						{amount}g
					</Button>
				{/each}
			</div>
		</div>
		<Ingredient name="Onion" icon={Onion} iconAlt="Onion" unit="g" value={onion} />
		<Ingredient name="Garlic" icon={Garlic} iconAlt="Garlic" unit="cloves" value={garlic} />
		<Ingredient name="Salt" icon={Salt} iconAlt="Salt" unit="tbsp" value={salt} decimals={1} />
	</div>
</div>
