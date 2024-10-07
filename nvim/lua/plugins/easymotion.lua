return {
  "easymotion/vim-easymotion",
  config = function()
    vim.g.EasyMotion_do_mapping = false
    vim.cmd([[
      nmap <leader><leader>s <Plug>(easymotion-s)
      nmap <leader><leader>h <Plug>(easymotion-linebackward)
      nmap <leader><leader>j <Plug>(easymotion-j)
      nmap <leader><leader>k <Plug>(easymotion-k)
      nmap <leader><leader>l <Plug>(easymotion-lineforward)
    ]])
  end,
}
