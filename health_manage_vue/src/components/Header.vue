<script>
export default {
  name: "Header",
  data(){
    return{
      activeIndex:"2",
      user:{}
    }
  },
  created() {
    let userStr =sessionStorage.getItem("user")||"{}"
    this.user=JSON.parse((userStr))
  },
  methods:{
    handleSelect(){

    },
    logout() {
      // 清除缓存中的用户数据
      sessionStorage.removeItem("user");
      // 跳转到登录页
      this.$router.push('/login');
    }
  }
}
</script>

<template>
  <el-menu
      :default-active="activeIndex"
      class="el-menu-demo"
      mode="horizontal"
      :ellipsis="false"
      @select="handleSelect"
  >
    <el-menu-item index="0">
      <a href="https://www.sysu.edu.cn/" style="margin:0; height: 80px">
        <img
            style="width: 150px;height: 45px"
            src="@/assets/Uni_logo.png"
            alt="中山大学"
        />
      </a>
    </el-menu-item>
    <div class="flex-grow" >
      <h1 style="text-align: center;color: midnightblue;margin:0">亚健康管理系统</h1>
    </div>
    <el-sub-menu index="2">
      <template #title>
        <el-avatar style="background-color: cornflowerblue;color: black">{{ user.username }}</el-avatar>
      </template>
      <el-menu-item index="2-1" @click="this.$router.push('/setting')">设置</el-menu-item>
      <el-menu-item index="2-2" @click="logout">退出</el-menu-item>
    </el-sub-menu>
  </el-menu>
</template>

<style scoped>
  .flex-grow {
    flex-grow: 1;
  }
</style>