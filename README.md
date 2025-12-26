# kowitz.net

Personal blog and website for Brendan Kowitz, built with [Astro](https://astro.build) and [Starlight](https://starlight.astro.build).

## About

This site covers topics including:
- **Health Data & FHIR** - Insights from 7+ years working with healthcare interoperability
- **AI-Assisted Development** - Exploring vibecoding and AI tools in software development
- **Software Engineering** - Best practices from building enterprise software at Microsoft

## Development

### Prerequisites
- Node.js 20+
- npm

### Getting Started

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

## Deployment

This site is configured for deployment on Azure Static Web Apps. The deployment workflow is defined in `.github/workflows/azure-static-web-apps.yml`.

### Setup Azure Static Web Apps

1. Create an Azure Static Web App resource in the Azure Portal
2. Add the `AZURE_STATIC_WEB_APPS_API_TOKEN` secret to your GitHub repository
3. Push to `main` branch to trigger deployment

## Project Structure

```
├── src/
│   ├── assets/           # Images and SVG assets
│   ├── content/
│   │   └── docs/         # Content pages (Markdown/MDX)
│   │       ├── blog/     # Blog posts
│   │       ├── about.md  # About page
│   │       └── index.mdx # Homepage
│   ├── styles/           # Custom CSS
│   └── content.config.ts # Content collection config
├── public/               # Static assets
├── astro.config.mjs      # Astro configuration
├── staticwebapp.config.json # Azure SWA config
└── package.json
```

## License

BSD 3-Clause License - see [LICENSE](LICENSE) for details.
