import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(), // Replace MyApp with your main app widget
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Glad to See You Here',
            style: TextStyle(
              color: Color(0xFF3E7F02),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/SDA_Logo 1.png',
                  width: 250.0,
                  height: 100.0,
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 280.0,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 280.0,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3E7F02),
                    foregroundColor: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign up here.',
                        style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  void _sendResetLink() {
    print('Reset link sent to $_email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Don\'t Worry☺️',
            style: TextStyle(
              color: Color(0xFF3E7F02),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/SDA_Logo 1.png',
                  width: 250.0,
                  height: 150.0,
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 280.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _sendResetLink();
                    }
                  },
                  child: Text(
                    'Send Reset Link',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3E7F02),
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to Login',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _confirmPassword = ''; // Add confirmPassword field
  String _mobileNumber = '';

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Join Us',
            style: TextStyle(
              color: Color(0xFF3E7F02),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/SDA_Logo 1.png',
                  width: 250.0,
                  height: 150.0,
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 280.0,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 280.0,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 280.0,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      } else if (_password != value) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onSaved: (value) => _confirmPassword = value!, // Save the value of Confirm Password
                  ),
                ),
                Container(
                  width: 280.0,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Mobile Number'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your mobile number';
                      } else if (!RegExp(r'^\+?0[0-9]{10}$').hasMatch(value)) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                    onSaved: (value) => _mobileNumber = value!,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _register();
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3E7F02),
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Login here.',
                        style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    LandingPage(),
    CategoriesPage(showAllProducts: true),
    CartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3E7F02),
        onTap: _onItemTapped,
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Welcome to Our Store',
            style: TextStyle(
              color: Color(0xFF3E7F02),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Banner Section
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Categories Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Shop by Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoriesPage(categoryName: 'Electronics')),
                      );
                    },
                    child: CategoryCard('Electronics', 'https://via.placeholder.com/150'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoriesPage(categoryName: 'Fashion')),
                      );
                    },
                    child: CategoryCard('Fashion', 'https://via.placeholder.com/150'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoriesPage(categoryName: 'Home Decor')),
                      );
                    },
                    child: CategoryCard('Home Decor', 'https://via.placeholder.com/150'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoriesPage(categoryName: 'Game Accessories')),
                      );
                    },
                    child: CategoryCard('Game Accessories', 'https://via.placeholder.com/150'),
                  ),
                ],
              ),
            ),
            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(12.3),
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDescriptionPage(
                        productName: 'Product 1',
                        imageUrl: 'assets/products/Product1.png',
                        price: 14.99,
                        description: 'This is a detailed description of Product 1.',
                      )),
                    );
                  },
                  child: ProductCard('Product 1', 'assets/products/Product1.png', 14.99),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDescriptionPage(
                        productName: 'Product 2',
                        imageUrl: 'assets/products/Product2.png',
                        price: 13.99,
                        description: 'This is a detailed description of Product 2.',
                      )),
                    );
                  },
                  child: ProductCard('Product 2', 'assets/products/Product2.png', 13.99),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDescriptionPage(
                        productName: 'Product 3',
                        imageUrl: 'assets/products/Product3.png',
                        price: 13.50,
                        description: 'This is a detailed description of Product 3.',
                      )),
                    );
                  },
                  child: ProductCard('Product 3', 'assets/products/Product3.png', 13.50),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDescriptionPage(
                        productName: 'Product 4',
                        imageUrl: 'assets/products/Product4.png',
                        price: 10.50,
                        description: 'This is a detailed description of Product 4.',
                      )),
                    );
                  },
                  child: ProductCard('Product 4', 'assets/products/Product4.png', 10.50),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  CategoryCard(this.categoryName, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(categoryName: categoryName),
          ),
        );
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categoryName),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final double price;

  ProductCard(this.productName, this.imageUrl, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(productName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${price.toString()}'),
          ),
        ],
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual logic to fetch products
    final List<Map<String, dynamic>> products = [
      // ... your product data with 'category' field
    ];

    // Filter products based on categoryName
    final filteredProducts = products.where((product) => product['category'] == categoryName).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.3),
        child: filteredProducts.isNotEmpty
            ? GridView.count(
          shrinkWrap: true, // Wrap content to avoid overflow
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 8,
          children: filteredProducts.map((product) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDescriptionPage(
                      productName: product['name'],
                      imageUrl: product['image'],
                      price: product['price'],
                      description: 'This is a detailed description of ${product['name']}.',
                    ),
                  ),
                );
              },
              child: ProductCard(product['name'], product['image'], product['price']),
            );
          }).toList(),
        )
            : Center(
          child: Text(
            'No products found in this category.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  final String? categoryName;
  final bool showAllProducts;

  CategoriesPage({this.categoryName, this.showAllProducts = false});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual logic to fetch categories
    final List<String> categories = ['Electronics', 'Fashion', 'Home Decor', 'Game Accessories'];

    // Filter products based on categoryName (null for all products)
    final List products = [
      // ... your product data with 'category' field
    ].where((product) => categoryName == null || product['category'] == categoryName).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName == null ? 'All Products' : categoryName!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.3),
        child: Column(
          children: [
            // Category list (replace with your navigation logic)
            Wrap(
              children: categories.map((category) => _buildCategoryItem(context, category)).toList(),
            ),
            SizedBox(height: 10.0), // Add a spacer between categories and products

            // Product grid
            if (products.isNotEmpty)
              GridView.count(
                shrinkWrap: true, // Wrap content to avoid overflow
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 8,
                children: products.map((product) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDescriptionPage(
                            productName: product['name'],
                            imageUrl: product['image'],
                            price: product['price'],
                            description: 'This is a detailed description of ${product['name']}.',
                          ),
                        ),
                      );
                    },
                    child: ProductCard(product['name'], product['image'], product['price']),
                  );
                }).toList(),
              ),
            if (products.isEmpty)
              Center(
                child: Text(
                  'No products found in this category.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String category) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(categoryName: category),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(category, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + item['price']);
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(
        child: Text(
          'Your Cart is Empty',
          style: TextStyle(fontSize: 24),
        ),
      )
          : ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartProvider.cartItems[index];
          return ListTile(
            leading: Image.asset(item['image'], width: 50, height: 50),
            title: Text(item['name']),
            subtitle: Text('\$${item['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                cartProvider.removeFromCart(index);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: cartProvider.cartItems.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage()),
            );
          },
          child: Text(
            'Proceed to Payment (\$${cartProvider.totalPrice.toStringAsFixed(2)})',
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3E7F02),
            foregroundColor: Colors.white,
          ),
        ),
      )
          : SizedBox.shrink(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          // Theme Switch (replace with your logic)
          SwitchListTile(
            title: Text('Dark Theme'),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              // Update theme based on value (e.g., Provider or custom logic)
              if (value) {
                setTheme(context, Brightness.dark);
              } else {
                setTheme(context, Brightness.light);
              }
            },
          ),

          // Language Selection (replace with your options)
          ListTile(
            title: Text('Language'),
            subtitle: Text(getCurrentLanguage(context)), // Replace with current language
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle language selection (e.g., navigate to language settings)
              // Navigator.push(
                // context,
                // MaterialPageRoute(
                  // builder: (context) => LanguageSettingsPage(), // Replace with language settings page
                // ),
              // );
            },
          ),

          // Logout Button (replace with your logic)
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              // Handle logout logic (e.g., confirmation dialog, navigation)
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Perform logout actions (e.g., clear user data, navigate to login)
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/login'); // Replace with your login route name
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// Helper functions to be replaced with your actual logic
void setTheme(BuildContext context, Brightness brightness) {
  // Update theme data based on brightness (e.g., Provider or ThemeData)
}

String getCurrentLanguage(BuildContext context) {
  // Replace with logic to get the current language (e.g., from SharedPreferences)
  return 'English'; // Example default language
}


class ProductDescriptionPage extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final double price;
  final String description;

  ProductDescriptionPage({
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                imageUrl,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              productName,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${price.toString()}',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                cartProvider.addToCart({
                  'name': productName,
                  'image': imageUrl,
                  'price': price,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$productName added to cart.')),
                );
              },
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xFF3E7F02),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Payment Methods',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Credit Card'),
              leading: Radio<String>(
                value: 'Credit Card',
                groupValue: 'paymentMethod',
                onChanged: (String? value) {
                  // Handle payment method change
                },
              ),
            ),
            ListTile(
              title: const Text('PayPal'),
              leading: Radio<String>(
                value: 'PayPal',
                groupValue: 'paymentMethod',
                onChanged: (String? value) {
                  // Handle payment method change
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement payment processing logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payment Successful!')),
                );
                // Clear the cart
                cartProvider.cartItems.clear();
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text(
                'Pay Now',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3E7F02),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}