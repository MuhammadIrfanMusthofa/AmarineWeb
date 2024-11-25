import React from "react";

import * as script from "../script";
import HeaderLogin from "../components/HeaderLogin";
import FooterLogin from "../components/FooterLogin";

function login() {
  return (
    <div>
      {/* Header */}
      <HeaderLogin />
      {/* Header End */}

      {/* Main Content */}
      <div className="main-content">
        <div className="wrapper-main-content-login wrapper-main-content-login1">
          <section className="section-gambar-login">
            <img src="assets/image-login.png" alt="" />
          </section>
          <section className="section-login">
            <header>Masuk</header>
            <form action="beranda">
              <input
                type="email"
                name=""
                id=""
                placeholder="Masukkan email"
                required
                onInvalid={(e) =>
                  e.target.setCustomValidity("Tolong masukkan Email!")
                }
                onInput={(e) => e.target.setCustomValidity("")}
              />
              <div className="password-input">
                <input
                  type="password"
                  name=""
                  id="password"
                  placeholder="Buat kata sandi"
                  required
                  onInvalid={(e) =>
                    e.target.setCustomValidity("Tolong masukkan Kata Sandi!")
                  }
                  onInput={(e) => e.target.setCustomValidity("")}
                />
                <img
                  src="assets/open-eye.svg"
                  alt=""
                  id="open-eye-password"
                  className="open-eye d-none"
                  onClick={() => script.togglePassword()}
                />
                <img
                  src="assets/close-eye.svg"
                  alt=""
                  id="close-eye-password"
                  className="close-eye"
                  onClick={() => script.togglePassword()}
                />
              </div>
              <div className="ingat-lupa-kata-sandi">
                <input
                  type="button"
                  value=""
                  name="s&k"
                  id="ingat-btn"
                  onClick={() => script.toggleIngat()}
                />
                <label for="ingat">Ingat nama pengguna</label>
                <a href="lupakatasandi1">Lupa Kata Sandi?</a>
              </div>
              <input type="submit" value="Masuk" />
            </form>
            <div className="divider">atau</div>
            <div className="media-sosial-login">
              <a href="login">
                <img src="assets/facebook.svg" alt="Facebook" />
              </a>
              <a href="login">
                <img src="assets/apple.svg" alt="Apple" />
              </a>
              <a href="login">
                <img src="assets/google.svg" alt="Google" />
              </a>
            </div>
            <div className="tidak-memiliki-akun">
              <span>Tidak memiliki akun?</span> <a href="daftar">Daftar</a>
            </div>
          </section>
        </div>
      </div>
      {/* Main Content End */}

      {/* Footer */}
      <FooterLogin />
      {/* Footer End */}
    </div>
  );
}

export default login;
