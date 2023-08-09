import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'

// FontAwesome Imports
import { library } from '@fortawesome/fontawesome-svg-core'
import { faMedium, faLinkedin, faGithub } from '@fortawesome/free-brands-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// Add the icons to the library (faUserSecret was just an example and can be removed)
library.add(faMedium, faLinkedin, faGithub)

const app = createApp(App)

// Register the FontAwesome component globally
app.component('font-awesome-icon', FontAwesomeIcon)  

app.use(createPinia())
app.use(router)

app.mount('#app')
