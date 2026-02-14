<script setup lang="ts">
import { QrcodeSvg } from 'qrcode.vue'

withDefaults(
  defineProps<{
    value: string
    size?: number
    level?: 'L' | 'M' | 'Q' | 'H'
  }>(),
  {
    size: 180,
    level: 'M',
  }
)
</script>

<template>
  <div class="inline-flex items-center justify-center rounded-lg bg-white p-3">
    <QrcodeSvg :value="value" :size="size" :level="level" render-as="svg" />
  </div>
</template>
