import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';

export async function GET(context) {
  const docs = await getCollection('docs');
  const blogPosts = docs.filter(doc => doc.id.startsWith('blog/'));

  return rss({
    title: 'Brendan Kowitz',
    description: 'Personal blog about software development, health data, FHIR, AI, and engineering leadership.',
    site: context.site,
    items: blogPosts.map((post) => ({
      title: post.data.title,
      pubDate: post.data.date || new Date(),
      description: post.data.description,
      link: `/${post.id}/`,
    })),
    customData: `<language>en-us</language>`,
  });
}
