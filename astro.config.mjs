import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import { remarkReadingTime } from './src/plugins/remark-reading-time.mjs';

// https://astro.build/config
export default defineConfig({
  site: 'https://kowitz.net',
  integrations: [
    starlight({
      title: 'Brendan Kowitz',
      components: {
        Head: './src/components/Head.astro',
      },
      description: 'Personal blog and thoughts on software development, health data, FHIR, and AI-assisted coding.',
      logo: {
        light: './src/assets/logo-light.svg',
        dark: './src/assets/logo-dark.svg',
        replacesTitle: false,
      },
      favicon: '/favicon.png',
      social: [
        { icon: 'github', label: 'GitHub', href: 'https://github.com/brendankowitz' },
        { icon: 'linkedin', label: 'LinkedIn', href: 'https://linkedin.com/in/brendankowitz' },
        { icon: 'rss', label: 'RSS', href: '/rss.xml' },
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
        {
          tag: 'meta',
          attrs: {
            property: 'og:image',
            content: 'https://kowitz.net/images/og-image.png',
          },
        },
        {
          tag: 'meta',
          attrs: {
            name: 'twitter:card',
            content: 'summary_large_image',
          },
        },
      ],
    }),
  ],
  output: 'static',
  markdown: {
    remarkPlugins: [remarkReadingTime],
  },
});
