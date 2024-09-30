<template xmlns="">
  <div style="margin:10px">
    <div>
      <el-button style="margin-right: 10px" @click="add">
        添加
      </el-button>
    </div>
    <el-input v-model="input" style="width: 400px" placeholder="搜索用户名" clearable></el-input>
    <el-button @click="load">搜索</el-button>
    <el-table :data="tableData" stripe style="width: 1300px">
      <el-table-column prop="id" label="ID"  />
      <el-table-column prop="username" label="用户名" />
      <el-table-column prop="password" label="密码" />
      <el-table-column prop="number" label="手机号" />
      <el-table-column prop="email" label="邮箱" />
      <el-table-column label="角色">
          <template #default="scope">
            <span v-if="scope.row.role===1">管理员</span>
            <span v-if="scope.row.role===0">普通用户</span>
          </template>
      </el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button size="small" @click="handleEdit(scope.row)">
            编辑
          </el-button>
          <el-button
              size="small"
              type="danger"
              @click="handleDelete(scope.row.id)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="example-pagination-block">
      <el-pagination
          layout="prev, pager, next"
          :total="50"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          v-model:current-page="currentPage"/>
<!--      <el-pagination-->
<!--          @size-change="handleSizeChange"-->
<!--          @current-change="handleCurrentChange"-->
<!--          :current-page="currentPage"-->
<!--          :page-sizes="[5, 10, 20]"-->
<!--          :page-size="pageSize"-->
<!--          layout="total, sizes, prev, pager, next, jumper"-->
<!--          :total=total>-->
<!--      </el-pagination>-->
    </div>

    <el-dialog v-model="dialogFormVisible" title="用户信息编辑" width="500">
      <el-form :model="form">
        <el-form-item label="用户名" :label-width="formLabelWidth">
          <el-input v-model="form.username" autocomplete="off" />
        </el-form-item>
        <el-form-item label="密码" :label-width="formLabelWidth">
          <el-input v-model="form.password" autocomplete="off" />
        </el-form-item>
        <el-form-item label="手机号" :label-width="formLabelWidth">
          <el-input v-model="form.number" autocomplete="off" />
        </el-form-item>
        <el-form-item label="邮箱" :label-width="formLabelWidth">
          <el-input v-model="form.email" autocomplete="off" />
        </el-form-item>
        <el-form-item label="角色" :label-width="formLabelWidth">
          <el-input v-model="form.role" placeholder="管理员输入1，普通用户输入0：" autocomplete="off" />
        </el-form-item>
      </el-form>
      <div class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="save">
          确认
        </el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import request from "@/utils/request";


export default {
  name: 'User_manage',
  components: {

  },
  data(){
    return{
      dialogFormVisible: false,
      form:{},
      tableData: [
      ],
      currentPage: 1,
      pageSize :10,
      input:"",
      total: 60
    }
  },
  created(){
    this.load();
  },
  methods:{
    load(){
      request.get("/api/user", {
        params:{
          pageNum: this.currentPage,
          pageSize: this.pageSize,
          search: this.input
        }
      }).then(res=>{
        console.log(res);
        this.tableData=res.data.records;
        this.total=res.data.total;
      })
    },

    add(){
      this.dialogFormVisible = true;
      this.form={};
    },
    save(){
      if(this.form.id){
        request.put("/api/user",this.form).then(res =>{
          console.log(res);
          if(res.code == '200'){
            this.$message({
              type: "success",
              message:"更新成功"
            })
          }else{
            this.$message({
              type:"error",
              message:"更新失败"
            })
          }
        })
      }else{
        request.post("/api/user",this.form).then(res =>{
          console.log(res);
          if(res.code == '200') {
            this.$message({
              type: "success",
              message: "新增成功"
            })
          }else{
            this.$message({
              type:"error",
              message:"新增失败"
            })
          }
        })
        this.load();
      }
      this.dialogFormVisible = false;
      this.load();
    },
    handleCurrentChange(pageNum){
      console.log(pageNum);
      this.currentPage = pageNum;
      this.load();
    },
    handleSizeChange(pageSize){
      console.log(pageSize);
      this.pageSize = pageSize;
      this.load()
    },
    handleDelete(id){
      console.log(id);
      request.delete(`/api/user/`+id).then(res =>{
        this.load();
        if(res.code == '200') {
          this.$message({
            type: "success",
            message: "删除成功"
          })
        }else{
          this.$message({
            type:"error",
            message:"删除失败"
          })
        }
      })
    },
    handleEdit(row){
      this.form = JSON.parse(JSON.stringify(row));
      this.dialogFormVisible = true;
    }
  }
}


</script>