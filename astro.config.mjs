import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
  site: 'https://kowitz.net',
  integrations: [
    starlight({
      title: 'Brendan Kowitz',
      description: 'Personal blog and thoughts on software development, health data, FHIR, and AI-assisted coding.',
      logo: {
        light: './src/assets/logo-light.svg',
        dark: './src/assets/logo-dark.svg',
        replacesTitle: false,
      },
      social: [
        { icon: 'github', label: 'GitHub', href: 'https://github.com/brendankowitz' },
        { icon: 'linkedin', label: 'LinkedIn', href: 'https://linkedin.com/in/brendankowitz' },
      ],
      sidebar: [
        {
          label: 'About',
          slug: 'about',
        },
        {
          label: 'Blog',
          autogenerate: { directory: 'blog' },
        },
      ],
      customCss: [
        './src/styles/custom.css',
      ],
      head: [
        {
          tag: 'meta',
          attrs: {
            name: 'author',
            content: 'Brendan Kowitz',
          },
        },
        {
          tag: 'meta',
          attrs: {
            property: 'og:type',
            content: 'website',
          },
        },
      ],
    }),
  ],
  output: 'static',
});
