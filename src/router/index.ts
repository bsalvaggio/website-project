import { createRouter, createWebHistory } from 'vue-router';

// Import your views (pages) here
import Welcome from '../views/Welcome.vue'
import About from '../views/About.vue'
import Articles from '../views/Articles.vue'
import Contact from '../views/Contact.vue'
import Projects from '../views/Projects.vue'
import Resume from '../views/Resume.vue'

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome
  },
  {
    path: '/about',
    name: 'About',
    component: About
  },
  {
    path: '/articles',
    name: 'Articles',
    component: Articles
  },
  {
    path: '/contact',
    name: 'Contact',
    component: Contact
  },
  {
    path: '/projects',
    name: 'Projects',
    component: Projects
  },
  {
    path: '/resume',
    name: 'Resume',
    component: Resume
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
