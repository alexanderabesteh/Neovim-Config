--> Compilers <--
local lang_maps = {
	cpp = {
		build = "clang++ -std=c++20 -Wall -Wextra -Wpedantic -g -O0 -fsanitize=address,undefined % -o %:r",
		exec = "%:r",
	},
	c = {
		build = "clang -std=c17 -Wall -Wextra -Wpedantic -g -O0 -fsanitize=address,undefined % -o %:r",
		exec = "%:r",
	},

	typescript = { exec = "bun run --strict %" },
	javascript = { exec = "bun run --strict %" },
	python = { exec = "uv run python -X dev -W default %" },
	-- python = { exec = "poetry run python %" },
	-- python = { exec = "python %" },
	java = {
		build = "mvn -q -T 1C compile",
		exec = "MAVEN_OPTS='-ea -XX:+ShowCodeDetailsInExceptionMessages' mvn -q exec:java",
	},
	sh = { exec = "bash -euxo pipefail %" },
	go = { exec = "go run -race -gcflags=all=-d=checkptr=1 %" },
	ruby = {
		exec = "ruby -w --debug --enable-frozen-string-literal %",
	},
	rust = { exec = "RUSTFLAGS='-Z sanitizer=address -C debuginfo=2' rustup run nightly cargo run" },
	swift = {
		build = "swiftc -g -Onone -enable-testing % -o %:r",
		exec = "%:r",
	},
	arduino = {
		build = "arduino-cli compile --warnings all --fqbn arduino:avr:uno %:r",
		exec = "arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:r",
	},
	asm = {
		build = "nasm -g -F dwarf -f elf64 -o %:r.o % && ld %:r.o -o %:r",
		exec = "cd %:p:h && ./%:t:r",
	},
}

--> Execute Compilers <--
for lang, data in pairs(lang_maps) do
	if data.build ~= nil then
		vim.api.nvim_create_autocmd(
			"FileType",
			{ command = "nnoremap <Leader>b :!" .. data.build .. "<CR>", pattern = lang }
		)
	end

	vim.api.nvim_create_autocmd("FileType", {
		command = "nnoremap <Leader>z :FloatermNew --autoclose=0 " .. data.exec .. "<CR>",
		pattern = lang,
	})
	-- vim.api.nvim_create_autocmd(
	-- 	"FileType",
	-- 	{ command = "nnoremap <Leader>z :split<CR>:terminal " .. data.exec .. "<CR>", pattern = lang }
	-- )
end
