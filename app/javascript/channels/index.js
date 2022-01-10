// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)



window.onload = () =>{

    const useRouterBtn = document.querySelector('.check__router')
    const formCloseWork = document.querySelector('.close__work-form')

    useRouterBtn.addEventListener('click', ()=>{
        if(useRouterBtn.checked){
            
            formCloseWork.style.opacity = '1'
            formCloseWork.style.height = '100%'
        }
        else{
            formCloseWork.style.opacity = '0'
            formCloseWork.style.height = '0'
        }
    })
}
