import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Layout from "../../layout/Layout.vue";
import Login from "@/views/Login.vue";
import Information_update from "@/views/Information_update.vue";
import Shopping from "@/views/Shopping.vue";
import Acknowledge from "@/views/Acknowledge.vue";
import Evaluation_and_advice from "@/views/Evaluation_and_advice.vue";
import User_manage from "@/views/User_manage.vue";
import Register from "@/views/Register.vue";
import Setting from "@/views/Setting.vue";
import Analysis_A from "@/views/Analysis_A.vue";

const routes = [
  {
    path: '/',
    name: 'lay',
    component: Layout,
    redirect: '/home',
    children:[
      {
        path:'home',
        name:'home',
        component:HomeView
      },
      {
        path:'/information_update',
        name:'information_update',
        component: Information_update
      },
      {
        path:'/shopping',
        name:'shopping',
        component: Shopping
      },
      {
        path:'/acknowledge',
        name:'acknowledge',
        component: Acknowledge
      },
      {
        path:'/e_and_a',
        name:'e_and_a',
        component: Evaluation_and_advice
      },
      {
        path:'/aa',
        name:'aa',
        component: Analysis_A
      },
      {
        path:'user_manage',
        name:'user_manage',
        component: User_manage
      },
      {
        path:'/setting',
        name:'Setting',
        component:Setting
      },
    ]
  },
  {
    path:'/login',
    name:'Login',
    component: Login
  },
  {
    path:'/register',
    name:'Register',
    component:Register
  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

// 添加一个 beforeEach 路由守卫,这里用于实现未登录情况下强制跳转/login
router.beforeEach((to, from, next) => {
  // 检查 sessionStorage 中是否已经有 user
  let user = sessionStorage.getItem('user');

  // 如果没有 user 且访问的不是登录界面，那么强制跳转至登录页面
  if (!user && to.path !== '/login'&& to.path !== '/register') {
    return next({ path: '/login' });
  }
  // 否则就继续进行本次路由
  next();
});
export default router
