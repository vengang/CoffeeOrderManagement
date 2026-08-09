class Announcement {
  final String img;
  final String title;
  final String subtitle;

  Announcement({
    required this.img,
    required this.title,
    required this.subtitle,
  });
}

List<Announcement> announcements = [
  Announcement(
    img:
        'https://images.squarespace-cdn.com/content/v1/56a87acd05f8e263f7b16c7f/6c4108d2-bf6b-4c96-a944-536003803eb2/2.png',
    title: 'Buy 1 Get 1 Free',
    subtitle: 'Enjoy Buy 1 Get 1 on all Iced Lattes this Friday only.',
  ),
  Announcement(
    img:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/ac/de/de/photo1jpg.jpg?w=1100&h=1100&s=1',
    title: 'Morning Coffee Deal',
    subtitle: 'Get 20% off every order before 10:00 AM.',
  ),
  Announcement(
    img:
        'https://amssc.aeonmallcambodia.com/wp-content/uploads/sites/3/2025/10/product-image-2-1024x724.jpg',
    title: 'New Seasonal Drinks',
    subtitle: 'Try our Pumpkin Spice Latte and Caramel Maple Cold Brew.',
  ),
  Announcement(
    img:
        'https://images.squarespace-cdn.com/content/v1/56a87acd05f8e263f7b16c7f/6c4108d2-bf6b-4c96-a944-536003803eb2/2.png',
    title: 'Free Delivery',
    subtitle: 'Free delivery for orders over \$15 this weekend.',
  ),
  Announcement(
    img:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/ac/de/de/photo1jpg.jpg?w=1100&h=1100&s=1',
    title: 'Collect Rewards',
    subtitle: 'Earn points with every purchase and redeem free drinks.',
  ),
];
