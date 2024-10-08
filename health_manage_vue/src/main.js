import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// main.ts

import 'element-plus/dist/index.css'
import ElementPlus from 'element-plus'
import zhCn from 'element-plus/es/locale/lang/zh-cn'



createApp(App).use(store).use(router).use(ElementPlus,{locale: zhCn,}).mount('#app')