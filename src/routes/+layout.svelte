<script lang="ts">
	import { base } from '$app/paths';

	import '../app.css';
	import { Button, Dropdown, DropdownItem } from 'flowbite-svelte';
	import { page } from '$app/stores';
	$: activeUrl = $page.url.pathname;
	$: console.log(activeUrl);

	const titleMap = {
		[`${base}/`]: 'Pizza Dough!',
		[`${base}/rice`]: 'Rice!',
		[`${base}/kebap`]: 'Kebap!'
	};

	$: titleOfDropdown = titleMap[activeUrl] || 'Default Title';
</script>

<div class="h-screen">
	<div class="text-center py-5 h-[10%] bg-slate-300">
		<Button
			><span class=" mr-2">{titleOfDropdown}</span>
			<svg
				xmlns="http://www.w3.org/2000/svg"
				width="16"
				height="16"
				fill="currentColor"
				class="bi bi-chevron-down"
				viewBox="0 0 16 16"
			>
				<path
					fill-rule="evenodd"
					d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708"
				/>
			</svg></Button
		>
		<Dropdown {activeUrl}>
			<DropdownItem href="{base}/">Pizza Dough!</DropdownItem>
			<DropdownItem href="{base}/rice">Rice!</DropdownItem>
			<DropdownItem href="{base}/kebap">Kebap!</DropdownItem>
		</Dropdown>
	</div>
	<div class="h-[90%]">
		<slot />
	</div>
</div>
