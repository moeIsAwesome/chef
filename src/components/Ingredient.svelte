<script lang="ts">
	export let icon: any;
	export let iconAlt: string;
	export let name: string;
	export let unit: 'tsp' | 'mL' | 'g' | 'tbsp' | 'cloves';
	export let value: any;
	export let decimals: number = 0;
</script>

<div class="flex justify-between items-center space-x-5">
	<span class="text-xl font-semibold md:text-2xl">{name}: {value.toFixed(decimals)} {unit}</span>
	<img src={icon} alt={iconAlt} height="64" width="64" />
</div>
