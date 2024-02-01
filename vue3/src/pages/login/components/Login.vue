<template>
  <t-form
    ref="form"
    :class="['item-container', `login-${type}`]"
    :data="formData"
    :rules="FORM_RULES"
    label-width="0"
    @submit="onSubmit"
  >
    <t-tabs :default-value="'password'" class="logintab" @change="changeLoginT">
      <t-tab-panel :value="'password'" label="账号登录" :style="{ paddingTop: '30px' }">
        <!-- <template> -->
        <t-form-item name="userName">
          <t-input v-model="formData.userName" size="large" placeholder="请输入登录账号/邮箱地址/手机号">
            <template #prefix-icon>
              <t-icon name="user" />
            </template>
          </t-input>
        </t-form-item>
        <t-form-item name="password">
          <t-input
            v-model="formData.password"
            size="large"
            :type="showPsw ? 'text' : 'password'"
            clearable
            placeholder="请输入登录密码"
          >
            <template #prefix-icon>
              <t-icon name="lock-on" />
            </template>
            <template #suffix-icon>
              <t-icon :name="showPsw ? 'browse' : 'browse-off'" @click="showPsw = !showPsw" />
            </template>
          </t-input>
        </t-form-item>
        <div class="check-container remember-pwd">
        </div>
      </t-tab-panel>
    </t-tabs>
    <t-form-item v-if="type !== 'qrcode'" class="btn-container">
      <t-button block size="large" type="submit" :loading="isLoad" :disabled="isCanLogin"> 登录 </t-button>
    </t-form-item>

  </t-form>
</template>

<script setup lang="ts">
import { onMounted, ref, computed } from 'vue';
import { useRouter } from 'vue-router';
import QrcodeVue from 'qrcode.vue';
import { MessagePlugin } from 'tdesign-vue-next';
import { useCounter } from '@/hooks';
import { useUserStore, useTabsRouterStore } from '@/store';
import proxy from '@/config/proxy';
import { sendSms } from '@/api/system/auth';

const userStore = useUserStore();
const tabsRouter = useTabsRouterStore();

const INITIAL_DATA = {
  phone: '',
  userName: 'system',
  password: 'Frsimple@2022',
  code: '',
  sp: '',
  checked: false,
  device: 'web',
};

const changeLoginT = async (value) => {
  type.value = value;
};
const FORM_RULES = {
  phone: [
    { required: true, message: '手机号必填', type: 'error' },
    { telnumber: true, message: '请输入正确的手机号码' },
  ],
  userName: [{ required: true, message: '账号必填', type: 'error' }],
  password: [{ required: true, message: '密码必填', type: 'error' }],
  code: [{ required: true, message: '验证码必填', type: 'error' }],
};

const env = import.meta.env.MODE || 'development';
const type = ref('password');

const formData = ref({ ...INITIAL_DATA });
const showPsw = ref(false);
const isCanLogin = computed(() => {
  if (type.value === 'password') {
    return !(formData.value.userName && formData.value.password);
  }
  return false;
});
const isCanSendSms = computed(() => {
  if (type.value === 'phone') {
    if (formData.value.phone && formData.value.phone.length === 11) {
      return false;
    }
    return true;
  }
  return true;
});

const form = ref(null);
const [countDown, handleCounter] = useCounter();
const sendSmsHandle = async () => {
  try {
    const res = await sendSms({
      sp: formData.value.phone,
    });
    if (res.code === 0) {
      handleCounter();
    } else {
      MessagePlugin.error(res.msg);
    }
  } catch (error) {
    MessagePlugin.error(`发送失败：${error}`);
  }
};
const switchType = (val: string) => {
  type.value = val;
};

const router = useRouter();


const isLoad = ref(false);
const onSubmit = async ({ validateResult }) => {
  if (validateResult === true) {
    try {
      // 开始登陆操作
      isLoad.value = true;
      if (type.value === 'password') {
        await userStore.login(formData.value);
      } else if (type.value === 'phone') {
        await userStore.loginByPhone(formData.value);
      }

      tabsRouter.initTabs();
      MessagePlugin.success('登陆成功');
      router.push({
        path: '/main',
      });
    } catch (e) {
      MessagePlugin.error(e.message);
    } finally {
      isLoad.value = false;
    }
  }
};
</script>

<style lang="less" scoped>
@import url('../index.less');

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.logintab {
  background-color: transparent !important;
}
.t-tabs__nav-container:after {
  background-color: transparent !important;
}
</style>
<style>
.t-tabs__nav-container.t-is-top::after {
  height: 0px !important;
}
</style>
