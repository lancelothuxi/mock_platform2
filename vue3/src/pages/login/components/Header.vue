<template>
  <header class="login-header">
    <div style="display: flex">
      <h2 class="tdesign-starter-side-nav-logo-tdesign-logo1">Mock Platform</h2>
    </div>
    <div class="operations-container">
    </div>
  </header>
</template>

<script setup lang="ts">
import tLogo from '@/assets/assets-t-logo.svg?component';
import LogoFullIcon from '@/assets/assets-logo-full.svg?component';
import { useSettingStore } from '@/store';

const settingStore = useSettingStore();
const toggleSettingPanel = () => {
  settingStore.updateConfig({
    showSettingPanel: true,
  });
};

const navToGitHub = () => {
  window.open('https://github.com/tencent/tdesign-vue-next-starter');
};

const navToHelper = () => {
  window.open('http://tdesign.tencent.com/starter/docs/get-started');
};
const goQQ = () => {
  // window.open('http://wpa.qq.com/msgrd?v=3&uin=2827916671&site=qq&menu=yes');
  window.open('https://frsimple.cn');
};
</script>

<style lang="less" scoped>
@import '@/style/variables.less';
.login-header {
  height: 64px;
  padding: 0 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  backdrop-filter: blur(5px);
  color: var(--tdvns-text-color-primary);

  .logo {
    width: 188px;
    height: 64px;
  }

  .operations-container {
    display: flex;
    align-items: center;
    .t-button {
      margin-left: 16px;
    }

    .icon {
      height: 20px;
      width: 20px;
      padding: 6px;
      box-sizing: content-box;

      &:hover {
        cursor: pointer;
      }
    }
  }
}
</style>
