# Documentation of My Neovim Config

Neovim is a text editor that is highly configurable. This is my configuration for Neovim.
I learn this for my own use, but I hope it can be useful to others.
And i learn neovim as an investment.

> **_Notice_**
>
> DO WITH YOUR OWN RISK
>
> I am not responsible for any damage that may occur.

## 📦 Plugins

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [auto-session](https://github.com/rmagatti/auto-session)
- [auto-session-nvim](https://github.com/rmagatti/auto-session-nvim)
- [autopairs-nvim](https://github.com/windwp/nvim-autopairs)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
- [cmp-nvim-ultisnips](https://github.com/hrsh7th/cmp-nvim-ultisnips)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-nvim-ultisnips](https://github.com/hrsh7th/cmp-nvim-ultisnips)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [colorizer.nvim](https://github.com/norcalli/nvim-colorizer.lua)
- [comment.nvim-colorizer.nvim](https://github.com/norcalli/nvim-colorizer.lua)
- [comment.nvim](https://github.com/numToStr/Comment.nvim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lsp-status.nvim](https://github.com/nvim-lualine/lsp-status.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [neotest](https://github.com/nvim-neotest/neotest)
- [neotest-python](https://github.com/nvim-neotest/neotest-python)
- [neotest-vim-test](https://github.com/nvim-neotest/neotest-vim-test)
- [neotest-plenary](https://github.com/nvim-neotest/neotest-plenary)
- [neotest-jest](https://github.com/nvim-neotest/neotest-jest)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [popup.nvim](https://github.com/nvim-lua/popup.nvim)
- [popup.nvim](https://github.com/nvim-lua/popup.nvim)
- [pretty-fold.nvim](https://github.com/anuvyklack/pretty-fold.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim)
- [telescope-frecency.nvim](https://github.com/nvim-telescope/telescope-frecency.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)

## List of Button used

### Raw Button

- a: memasuki mode Insert setelah kursor.
- b: berpindah ke awal kata sebelumnya.
- c: menghapus teks sesuai perintah berikutnya dan memasuki mode Insert.
- d: menghapus teks sesuai perintah berikutnya.
- e: berpindah ke akhir kata berikutnya.
- f: mencari karakter berikutnya dalam baris.
- g: digunakan untuk berbagai perintah navigasi (misalnya, gg untuk ke awal dokumen).
- h: berpindah satu karakter ke kiri.
- i: memasuki mode Insert sebelum kursor.
- j: berpindah satu baris ke bawah.
- k: berpindah satu baris ke atas.
- l: berpindah satu karakter ke kanan.
- m: menandai posisi kursor saat ini dengan nama tertentu.
- n: mencari kemunculan berikutnya dari pencarian terakhir.
- o: membuka baris baru di bawah dan memasuki mode Insert.
- p: menempelkan teks dari clipboard setelah kursor.
- q: merekam makro.
- r: mengganti karakter di bawah kursor.
- s: menghapus karakter di bawah kursor dan memasuki mode Insert.
- t: mencari karakter berikutnya dalam baris dan berhenti sebelum karakter tersebut.
- u: membatalkan perubahan terakhir.
- v: memasuki mode Visual untuk memilih teks.
- w: berpindah ke awal kata berikutnya.
- x: menghapus karakter di bawah kursor.
- y: menyalin (yank) teks yang dipilih.
- z: digunakan untuk berbagai perintah tampilan (misalnya, zz untuk men-scroll baris saat ini ke tengah layar).

- /: memulai pencarian maju.
- :: memasuki mode Command untuk menjalankan perintah baris.
- .: mengulangi perintah terakhir.
- ,: Tidak ada fungsi default khusus; dapat digunakan untuk mapping kustom.
- ;: mengulangi perintah f, F, t, atau T terakhir.
- ': berpindah ke mark lokal pada baris pertama.
- ": digunakan untuk memilih register sebelum operasi yank, delete, atau paste.
- `: berpindah ke mark lokal pada posisi kolom terakhir.
- ~: mengubah huruf di bawah kursor antara huruf besar dan kecil.
- <: menggeser teks yang dipilih ke kiri.
- \>: menggeser teks yang dipilih ke kanan.
- \*: mencari kemunculan berikutnya dari kata di bawah kursor.
- #: mencari kemunculan sebelumnya dari kata di bawah kursor.
- -: berpindah ke baris non-blank sebelumnya.
- =: digunakan untuk auto-indent teks.
- \_: berpindah ke baris non-blank berikutnya.
- `: berpindah ke mark lokal pada posisi kolom terakhir.
- |: berpindah ke kolom tertentu dalam baris.
- \: Tidak ada fungsi default khusus; dapat digunakan untuk mapping kustom.

- 0: berpindah ke awal baris.
- 1-9: digunakan sebagai pengulangan perintah (misalnya, 3w untuk berpindah tiga kata ke depan).

- Esc: Keluar dari mode Insert atau Visual, kembali ke mode Normal.

### Combined Button

### Button with leader key

#### Normal Mode

- ctrl + a: No command.
- ctrl + b: ???
- ctrl + c: Comment line or selection.
- ctrl + d: No command.
- ctrl + e: Default command.
- ctrl + f: ???
- ctrl + g: No command.
- ctrl + h: Move to the left of the window.
- ctrl + i: Move to next tab.
- ctrl + j: No command.
- ctrl + k: No command.
- ctrl + l: Move to the right of the window.
- ctrl + m: Default command.
- ctrl + n: Open a terminal in the current directory.
- ctrl + o: Default command. (To go back to where you came)
- ctrl + p:
- ctrl + q:
- ctrl + r:
- ctrl + s:
- ctrl + t:
- ctrl + u:
- ctrl + v:
- ctrl + w:
- ctrl + x:
- ctrl + y:
- ctrl + z:

#### Insert Mode

- ctrl + a: Accept supermaven suggestion.
- ctrl + b: ???
- ctrl + c: Comment line or selection.
- ctrl + d: No command.
- ctrl + e: Default command.
- ctrl + f: ???
- ctrl + g: Show line number.
- ctrl + h: Move to the left of the window.
- ctrl + i: Move to next tab.
- ctrl + j: No command.
- ctrl + k: No command.
- ctrl + l: Move to the right of the window.
- ctrl + m: Default command.
- ctrl + n: ???
- ctrl + o:
- ctrl + p:
- ctrl + q:
- ctrl + r:
- ctrl + s:
- ctrl + t:
- ctrl + u:
- ctrl + v:
- ctrl + w:
- ctrl + x:
- ctrl + y:
- ctrl + z:

### Button with ctrl key

- leader + a
- leader + b
- leader + c
- leader + d
- leader + e
- leader + f
- leader + g
- leader + h
- leader + i
- leader + j
- leader + k
- leader + l
- leader + m
- leader + n
- leader + o
- leader + p
- leader + q
- leader + r
- leader + s
- leader + t
- leader + u
- leader + v
- leader + w
- leader + x
- leader + y
- leader + z
