import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';

export async function GET(context) {
  const docs = await getCollection('docs');
  const blogPosts = docs.filter(doc => 
    doc.id.startsWith('blog/') && 
    !doc.id.endsWith('index') &&
    doc.data.draft !== true
  );

  const sortedPosts = blogPosts.sort((a, b) => {
    const dateA = a.data.date ? new Date(a.data.date).getTime() : 0;
    const dateB = b.data.date ? new Date(b.data.date).getTime() : 0;
    return dateB - dateA;
  });

  return rss({
    title: 'Brendan Kowitz',
    description: 'Personal blog about software development, health data, FHIR, AI, and engineering leadership.',
    site: context.site,
    items: sortedPosts.map((post) => ({
      title: post.data.title,
      pubDate: post.data.date,
      description: post.data.description,
      link: `/${post.id}/`,
    })),
    customData: `<language>en-us</language>`,
  });
}
