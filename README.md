# Instructions for setting up `vimtex` on windows

1. Install the latest stable snapshot version of vim from https://www.vim.org/download.php
   
2. Add a new environment variable `VIM` in the system properties with your Vim installation folder path. (New variable with name = `VIM` and value = `<vim-installation-path>`)

3. Add a plugin manager `vim-plug` by executing following command in `Windows PowerShell`.
    ```
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$env:VIM/vimfiles/autoload/plug.vim" -Force
    ```

4. Locate the `_vimrc` file in the Vim installation folder, and add the following snippet at the end.
    ```
    " Begin plugin section for vim-plug
    call plug#begin('<your-vim-installation-path>/vimfiles/plugged')

    " Add your plugins below:
    Plug 'lervag/vimtex'

    call plug#end()
    ```
    
    Make sure to replace `<your-vim-installation-path>` with your actual path

5. Save the `_vimrc` file, open vim app, and run the following command.
    ```
    :PlugInstall
    ```

6. Install `SumatraPDF` from https://www.sumatrapdfreader.org/download-free-pdf-viewer,
 and add the pdfviewer installation folder path to PATH variable in environment variables.

7. Add the following vimtex configuration in `_vimrc`.
    ```
    " VimTeX configuration
    filetype plugin indent on
    syntax enable

    let g:vimtex_view_method = 'general'
    let g:vimtex_view_general_viewer = '<sumatra-installatin-path>/SumatraPDF.exe'
    let g:vimtex_compiler_method = 'latexmk'
    let g:tex_flavor='latex'
    let g:vimtex_quickfix_mode=1
    ```

    Make sure to replace `<sumatra-installatin-path>` with your actual path.

8. To enable save, copy, cut, paste, undo operations with `control` key in vim (if not working by default),
   add the following configuration in the `_vimrc` file.
    ```
    nnoremap <C-s> :w<CR>
    inoremap <C-s> <Esc>:w<CR>a
    vnoremap <C-c> "+y
    vnoremap <C-x> "+d
    inoremap <C-v> <C-r>+
    nnoremap <C-v> "+p
    inoremap <C-z> <C-o>u
    nnoremap <C-z> u
    ```
9. To enable the line numbering, add the following to the `_vimrc` file.
    ```
    set number
    ```
10. For the light background Delek theme, add the following to the `_vimrc` file.
    ```
    colorscheme Delek
    set termguicolors
    ```
11. To reload Vim with an updated configuration:
    ```
    :source $MYVIMRC
    ```
12. To open a file in vim:
    ```
    :e <file-path>
    ```
- The following is set up with the help of https://castel.dev/post/lecture-notes-1/
  and https://ejmastnak.com/tutorials/vim-latex/intro/.
13. To enable concealing, add the following to the `_vimrc` file.
    ```
    set conceallevel=1
    let g:tex_conceal='abdmg'
    highlight Conceal ctermfg=blue guifg=blue
    ```
14. For snippets, to use the plugin `UltiSnips`, add the following in the plugin section of the `_vimrc` file.
    ```
    Plug 'sirver/ultisnips'
    ```
    Execute `PlugInstall` in Vim (as administrator).
15. Create the folder `UltiSnips` inside `<your-vim-installation-path>/vimfiles/`, and create/copy the file [tex.snippets](./tex.snippets) in this folder.
    Add the following to the `vimrc` file.
    ```
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories=["UltiSnips"]
    ```
    The file `tex.snippets` is a modified version of https://github.com/gillescastel/latex-snippets/blob/master/tex.snippets. 
16. For correcting spellings in US English using `ctrl+l`, add the following to the `_vimrc` file.
    ```
    setlocal spell
    set spelllang=en_us
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
    ```
