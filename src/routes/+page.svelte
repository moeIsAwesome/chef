<script lang="ts">
	import { Tooltip, Range, Label, Input, Button } from 'flowbite-svelte';
	import Yeast from '../../src/icons/yeast.png';
	import Honey from '../../src/icons/honey.png';
	import Salt from '../../src/icons/salt.png';
	import Flour from '../../src/icons/flour.png';
	import Water from '../../src/icons/water.png';
	import OiliveOil from '../../src/icons/oliveOil.png';
	import Icon from '@iconify/svelte';
	import Ingredient from '../components/Ingredient.svelte';

	let flour: number = 0;
	let hydration:number = 65;

	$: yeast = flour * 0.003;
	$: honey = yeast * 1.75;
	$: salt = flour * 0.025;
	$: oliveOil = flour * 0.0075;
	$: water = (flour * hydration) / 100;
</script>

<div
	class="h-full bg-slate-300 flex justify-center items-center flex-col overflow-hidden space-y-8"
>
	<div class="text-center">
		<div class="md:text-3xl text-2xl font-bold text-orange-500"><h1>Pizza Dough!</h1></div>
		<Label class="flex justify-center items-center ">
			<span class="mr-2"> Hydration {hydration}% </span>
			<div class="hidden md:block">
				<Icon
					icon="heroicons-outline:information-circle"
					width="20"
					height="20"
					style="color: black"
				/>
				<Tooltip placement="right" color="blue"
					>More hydration means more water, resulting in a thicker crust that is also more difficult
					to work with
				</Tooltip>
			</div>
		</Label>
		<Range
			id="range-minmax"
			min="50"
			max="70"
			bind:value={hydration}
			class="ring-orange-200 text-xl bg-red-500"
		/>
	</div>
	<div class="flex flex-col space-y-5 md:space-y-6 w-full md:w-[45%] md:px-4 px-4">
		<div class="border-b-2 flex flex-col items-center border-orange-500">
			<div class="flex w-full justify-between space-x-3">
				<div class="flex items-center">
					<Label for="flour" class="text-xl font-semibold md:text-2xl mr-2">Flour:</Label>
					<div class="flex space-x-2">
						<Input type="number" id="flour" placeholder="1000" bind:value={flour} class="w-24" />
						<span class="text-2xl">g</span>
					</div>
				</div>

				<img src={Flour} alt="Flour" height="64" width="64" />
			</div>
			<div class="py-4 md:space-x-2 space-x-1">
				{#each [250, 500, 750, 1000] as amount}
					<Button
						color="alternative"
						class="focus:ring-2 focus:ring-orange-500"
						on:click={() => {
							flour = amount;
						}}
					>
						{amount}g
					</Button>
				{/each}
			</div>
		</div>

		<Ingredient name="Water" icon={Water} iconAlt="Water" unit="mL" value={water} />
		<Ingredient name="Yeast" icon={Yeast} iconAlt="Yeast" unit="g" value={yeast} decimals={1} />
		<Ingredient name="Honey" icon={Honey} iconAlt="Honey" unit="g" value={honey} />
		<Ingredient name="Salt" icon={Salt} iconAlt="Salt" unit="g" value={salt} />
		<Ingredient name="Olive Oil" icon={OiliveOil} iconAlt="Olive Oil" unit="g" value={oliveOil} />
	</div>
</div>
