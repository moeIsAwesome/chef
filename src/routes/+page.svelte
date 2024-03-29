<script lang="ts">
	import { Tooltip, Range, Label, Input, Button, Radio } from 'flowbite-svelte';
	import Yeast from '../../src/icons/yeast.png';
	import Honey from '../../src/icons/honey.png';
	import Salt from '../../src/icons/salt.png';
	import Flour from '../../src/icons/flour.png';
	import Water from '../../src/icons/water.png';
	import OiliveOil from '../../src/icons/oliveOil.png';
	import Icon from '@iconify/svelte';
	import Ingredient from '../components/Ingredient.svelte';
	import CookingCheckbox from '../components/CookingCheckbox.svelte';

	import Beer from '../../src/icons/beer.png';

	let flour: number = 500;
	let hydration: number = 67;
	let yeast: number;
	let honey: number;
	let salt: number;
	let oliveOil: number;
	let waterForNormalDough: number;
	let waterForBeerDough: number;
	let beer: number;

	const ingrediaentsCalculator = (flour: number, hydration: number) => {
		yeast = flour * 0.004;
		honey = yeast * 2.2;
		salt = flour * 0.025;
		oliveOil = flour * 0.0075;

		waterForNormalDough = (flour * hydration) / 100;

		waterForBeerDough = ((flour * hydration) / 100) * 0.55;

		beer = ((flour * hydration) / 100) * 0.45;

		return {
			yeast,
			honey,
			salt,
			oliveOil,
			waterForNormalDough,
			waterForBeerDough,
			beer
		};
	};
	$: ingrediaentsCalculator(flour, hydration);
	let pizzaDoughTypes = ['normal', 'beer'];
	let selectedType: 'normal' | 'beer' = 'normal';

	$: bearDoughInstruction = [
		{
			name: 'flourIns',
			instruction: `Add ${waterForBeerDough.toFixed(0)}mL of lukewarm water.`,
			isDisabled: false,
			isChecked: false
		},
		{
			name: 'yeast',
			instruction: `Add ${yeast.toFixed(1)}g of yeast.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'honey',
			instruction: `Add ${honey.toFixed(0)}g of honey.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest1',
			instruction: 'Mix and cover it, and let it rest for 30 minutes at room temperature.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'flour1',
			instruction: `Add ${(flour * 0.7).toFixed(0)}g of flour.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'beer',
			instruction: `Add ${beer.toFixed(0)}mL of beer.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest2',
			instruction: 'Let it rest for four hours at room temperature.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest3',
			instruction: 'Move it to the fridge and let it rest for 24 hours.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'flour2',
			instruction: `Add ${(flour * 0.3).toFixed(0)}g of the remaining flour.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'salt',
			instruction: `Add ${salt.toFixed(0)}g of salt.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'oliveOil',
			instruction: `Add ${oliveOil.toFixed(0)}g of olive oil.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'dough',
			instruction: 'Knead the dough for 25 minutes.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest4',
			instruction: 'Let it rest for two hours at room temperature.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest5',
			instruction: 'Move it to the fridge and let it rest for 24 hours.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest6',
			instruction: 'Take it out two hours before making pizza and shape into 280 g balls.',
			isDisabled: true,
			isChecked: false
		}
	];

	$: normalDoughInstruction = [
		{
			name: 'water',
			instruction: `Add ${waterForNormalDough.toFixed(0)}mL of lukewarm water.`,
			isDisabled: false,
			isChecked: false
		},
		{
			name: 'yeast',
			instruction: `Add ${yeast.toFixed(1)}g of yeast.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'honey',
			instruction: `Add ${honey.toFixed(0)}g of honey.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'flourIns',
			instruction: `Add 10% of the flour meaning ${(flour * 0.1).toFixed(0)}g of flour.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest1',
			instruction: 'Mix and cover it, and let it rest for 30 minutes at room temperature.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'flour1',
			instruction: `Add the remaining ${(flour * 0.9).toFixed(0)}g of flour.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'salt',
			instruction: `Add ${salt.toFixed(0)}g of salt.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'oliveOil',
			instruction: `Add ${oliveOil.toFixed(0)}g of olive oil.`,
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'dough',
			instruction: 'Knead the dough for 25 minutes.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest2',
			instruction: 'Let it rest for three hours at room temperature.',
			isDisabled: true,
			isChecked: false
		},
		{
			name: 'rest3',
			instruction: 'Move it to the fridge and let it rest for 36 hours.',
			isDisabled: true,
			isChecked: false
		},

		{
			name: 'rest6',
			instruction: 'Take it out four hours before making pizza and shape into 280 g balls.',
			isDisabled: true,
			isChecked: false
		}
	];
</script>

<div class="bg-slate-300 flex justify-center items-center flex-col py-12">
	<div class="text-center mb-8">
		<div class="md:text-3xl text-2xl font-bold text-orange-500"><h1>Pizza Dough!</h1></div>

		<div class="flex py-5">
			<div class="border-2 border-primary-500 rounded-lg p-2 px-4 bg-slate-200 flex space-x-4">
				{#each pizzaDoughTypes as value}
					<Radio {value} bind:group={selectedType}>{value}</Radio>
				{/each}
			</div>
		</div>

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
	{#if selectedType === 'normal'}
		<div
			class="flex w-full justify-center md:space-x-20 flex-col md:flex-row items-center space-y-5"
		>
			<div class="flex flex-col space-y-5 md:space-y-6 w-full md:w-[45%] md:px-4 px-4">
				<div class="border-b-2 flex flex-col items-center border-orange-500">
					<div class="flex w-full justify-between space-x-3">
						<div class="flex items-center">
							<Label for="flour" class="text-xl font-semibold md:text-2xl mr-2">Flour:</Label>
							<div class="flex space-x-2">
								<Input
									type="number"
									id="flour"
									placeholder="1000"
									bind:value={flour}
									class="w-24"
								/>
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

				<Ingredient
					name="Water"
					icon={Water}
					iconAlt="Water"
					unit="mL"
					value={waterForNormalDough}
				/>
				<Ingredient name="Yeast" icon={Yeast} iconAlt="Yeast" unit="g" value={yeast} decimals={1} />
				<Ingredient name="Honey" icon={Honey} iconAlt="Honey" unit="g" value={honey} />
				<Ingredient name="Salt" icon={Salt} iconAlt="Salt" unit="g" value={salt} />
				<Ingredient
					name="Olive Oil"
					icon={OiliveOil}
					iconAlt="Olive Oil"
					unit="g"
					value={oliveOil}
				/>
			</div>
			<div>
				<h1 class="bg-slate-400 text-center text-lg py-5 font-semibold">Let's Cook!</h1>
				<CookingCheckbox bind:instruction={normalDoughInstruction} />
			</div>
		</div>
	{:else if selectedType === 'beer'}
		<div
			class="flex w-full justify-center md:space-x-20 flex-col md:flex-row items-center space-y-5"
		>
			<div class="flex flex-col space-y-5 md:space-y-6 w-full md:w-[45%] md:px-4 px-4">
				<div class="border-b-2 flex flex-col items-center border-orange-500">
					<div class="flex w-full justify-between space-x-3">
						<div class="flex items-center">
							<Label for="flour" class="text-xl font-semibold md:text-2xl mr-2">Flour:</Label>
							<div class="flex space-x-2">
								<Input
									type="number"
									id="flour"
									placeholder="1000"
									bind:value={flour}
									class="w-24"
								/>
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

				<Ingredient name="Beer" icon={Beer} iconAlt="Beer" unit="mL" value={beer} />
				<Ingredient
					name="Water"
					icon={Water}
					iconAlt="Water"
					unit="mL"
					bind:value={waterForBeerDough}
				/>
				<Ingredient name="Yeast" icon={Yeast} iconAlt="Yeast" unit="g" value={yeast} decimals={1} />
				<Ingredient name="Honey" icon={Honey} iconAlt="Honey" unit="g" value={honey} />
				<Ingredient name="Salt" icon={Salt} iconAlt="Salt" unit="g" value={salt} />
				<Ingredient
					name="Olive Oil"
					icon={OiliveOil}
					iconAlt="Olive Oil"
					unit="g"
					value={oliveOil}
				/>
			</div>
			<div>
				<h1 class="bg-slate-400 text-center text-lg py-5 font-semibold">Let's Cook!</h1>
				<CookingCheckbox bind:instruction={bearDoughInstruction} />
			</div>
		</div>
	{/if}
</div>
