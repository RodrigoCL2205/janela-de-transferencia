const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const banner = document.querySelector('.banner');
  const height = banner.clientHeight;
  console.log(`height: ${height}`)

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= height) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
