import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF6359E8),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // Paleta extraída da imagem de referência
  static const Color _primary = Color(0xFF6359E8);
  static const Color _primaryLight = Color(0xFF6F66F0);
  static const Color _primaryDark = Color(0xFF5A4EE2);
  static const Color _textDark = Color(0xFF101828);
  static const Color _textGrey = Color(0xFF717684);
  static const Color _fieldBackground = Color(0xFFF2F3F7);
  static const Color _fieldBorder = Color(0xFFE8E9EE);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  OutlineInputBorder _border(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 28),

              // ===== Logo =====
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [_primaryLight, _primaryDark],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: _primary.withOpacity(0.30),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.phone_iphone,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // ===== Título =====
              const Text(
                'Bem-vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 10),

              // ===== Subtítulo =====
              const Text(
                'Acesse sua conta para continuar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: _textGrey,
                ),
              ),
              const SizedBox(height: 40),

              // ===== Campo E-mail =====
              const Text(
                'E-mail',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 15, color: _textDark),
                decoration: InputDecoration(
                  hintText: 'seu@email.com',
                  hintStyle: const TextStyle(color: _textGrey, fontSize: 15),
                  filled: true,
                  fillColor: _fieldBackground,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  border: _border(_fieldBorder),
                  enabledBorder: _border(_fieldBorder),
                  focusedBorder: _border(_primary, 1.6),
                ),
              ),
              const SizedBox(height: 22),

              // ===== Campo Senha =====
              const Text(
                'Senha',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(fontSize: 15, color: _textDark),
                decoration: InputDecoration(
                  hintText: '••••••••',
                  hintStyle: const TextStyle(
                    color: _textGrey,
                    fontSize: 15,
                    letterSpacing: 2.0,
                  ),
                  filled: true,
                  fillColor: _fieldBackground,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  border: _border(_fieldBorder),
                  enabledBorder: _border(_fieldBorder),
                  focusedBorder: _border(_primary, 1.6),
                  suffixIcon: IconButton(
                    splashRadius: 22,
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: _textGrey,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // ===== Esqueci minha senha =====
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: const Size(0, 48),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                  ),
                  child: const Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                      color: _primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),

              // ===== Botão Entrar =====
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [_primaryLight, _primaryDark],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: _primary.withOpacity(0.35),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // ===== Divisor "ou continue com" =====
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: _fieldBorder, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'ou continue com',
                      style: TextStyle(
                        color: _textGrey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: _fieldBorder, thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // ===== Botões sociais =====
              Row(
                children: [
                  Expanded(
                    child: _SocialButton(
                      borderColor: _fieldBorder,
                      child: CustomPaint(
                        size: const Size(24, 24),
                        painter: _GoogleLogoPainter(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: _SocialButton(
                      borderColor: _fieldBorder,
                      child: Icon(
                        Icons.apple,
                        size: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // ===== Rodapé =====
              Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 48),
                    alignment: Alignment.center,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Não tem uma conta? ',
                        style: TextStyle(
                          color: _textGrey,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: 'Cadastre-se',
                            style: TextStyle(
                              color: _primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

/// Botão social reutilizável (borda arredondada, fundo branco, toque mínimo 56px).
class _SocialButton extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  const _SocialButton({required this.child, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

/// Logo do Google ("G" multicolorido) desenhada sem pacotes externos.
class _GoogleLogoPainter extends CustomPainter {
  static const Color _blue = Color(0xFF4285F4);
  static const Color _red = Color(0xFFEA4335);
  static const Color _yellow = Color(0xFFFBBC05);
  static const Color _green = Color(0xFF34A853);

  double _rad(double deg) => deg * math.pi / 180.0;

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double stroke = w * 0.22;
    final double radius = (w - stroke) / 2;
    final Offset center = Offset(w / 2, w / 2);
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    final Paint arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.butt;

    // Anel em 4 cores (sentido horário a partir de leste)
    canvas.drawArc(rect, _rad(20), _rad(100), false, arc..color = _green);
    canvas.drawArc(rect, _rad(120), _rad(90), false, arc..color = _yellow);
    canvas.drawArc(rect, _rad(-150), _rad(90), false, arc..color = _red);
    canvas.drawArc(rect, _rad(-60), _rad(45), false, arc..color = _blue);

    // Barra horizontal azul (do centro até a abertura do anel, à direita)
    final Paint bar = Paint()..color = _blue;
    final Rect barRect = Rect.fromLTRB(
      center.dx - stroke * 0.1,
      center.dy - stroke / 2,
      center.dx + radius + stroke / 2,
      center.dy + stroke / 2,
    );
    canvas.drawRect(barRect, bar);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
