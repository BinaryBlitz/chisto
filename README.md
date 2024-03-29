# Chisto

## Set up

- Ruby version: see `.ruby-version`
- System dependencies: `brew install imagemagick postgresql redis`
- Configuration: `secrets.yml`
- Database initialization: `$ rails db:setup`
- How to run the test suite: `$ rails test`

## Architecture

Chisto consists of the following components:

- **API** (`https://chisto.xyz/api`). The backend for iOS and Android clients. Uses token-based authentication. Files: `app/controllers/api/*`
- **Admin area** (`https://admin.chisto.xyz`). Admin dashboard for internal use. Uses Devise for authentication. Files: `app/controllers/admin/*`
- **Partner area** (`https://partner.chisto.xyz`). For use by partners to manage their services. Uses Devise for authentication. Files: `app/controllers/partner/*`
- **Landing** (`https://chisto.xyz`). Landing page with contact forms. Files: `app/controllers/landing/*`

## Demo

URL: [staging](https://chisto.xyz), [production](https://chis.to)

### API

- Phone number: `+7 999 111-22-33`
- Verification code: `12345`

## Admin & partner dashboards

- Email: `foo@bar.com`
- Password: `qwerty123`
