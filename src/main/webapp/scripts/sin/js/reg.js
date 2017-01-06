requirejs.config({
    baseUrl: "/public",
    paths: {
        text: "javascripts/libs/text",
        jquery: "javascripts/libs/jquery",
        underscore: "javascripts/libs/lodash.underscore",
        backbone: "javascripts/libs/backbone",
        marionette: "javascripts/libs/backbone.marionette",
        "jquery.validate": "javascripts/libs/jquery.validate",
        "jquery.cookie": "javascripts/libs/jquery.cookie",
        login_app: "javascripts/apps/login",
        register_app: "javascripts/apps/register",
        details_app: "javascripts/apps/details",
        activate_app: "javascripts/apps/activate",
        completed_app: "javascripts/apps/completed",
        wechat_app: "javascripts/apps/wechat",
        audited_app: "javascripts/apps/audited",
        retrieve_password_app: "javascripts/apps/retrieve_password"
    },
    shim: {
        backbone: {
            deps: ["jquery", "underscore"],
            exports: "Backbone"
        },
        marionette: {
            deps: ["backbone"],
            exports: "Marionette"
        },
        "jquery.validate": {
            deps: ["jquery"]
        },
        "jquery.cookie": {
            deps: ["jquery"]
        },
        login_app: {
            deps: ["text", "marionette"]
        },
        wechat_app: {
            deps: ["text", "marionette"]
        },
        register_app: {
            deps: ["text", "marionette"]
        },
        details_app: {
            deps: ["text", "marionette"]
        },
        activate_app: {
            deps: ["text", "marionette"]
        },
        completed_app: {
            deps: ["text", "marionette"]
        },
        retrieve_password_app: {
            deps: ["text", "marionette"]
        }
    }
}),
define("config",
function() {}),
define("text", ["module"],
function(e) {
    var t, n, i, r, o, s = ["Msxml2.XMLHTTP", "Microsoft.XMLHTTP", "Msxml2.XMLHTTP.4.0"],
    a = /^\s*<\?xml(\s)+version=[\'\"](\d)*.(\d)*[\'\"](\s)*\?>/im,
    u = /<body[^>]*>\s*([\s\S]+)\s*<\/body>/im,
    l = "undefined" != typeof location && location.href,
    c = l && location.protocol && location.protocol.replace(/\:/, ""),
    d = l && location.hostname,
    h = l && (location.port || void 0),
    f = {},
    p = e.config && e.config() || {};
    return t = {
        version: "2.0.10",
        strip: function(e) {
            if (e) {
                e = e.replace(a, "");
                var t = e.match(u);
                t && (e = t[1])
            } else e = "";
            return e
        },
        jsEscape: function(e) {
            return e.replace(/(['\\])/g, "\\$1").replace(/[\f]/g, "\\f").replace(/[\b]/g, "\\b").replace(/[\n]/g, "\\n").replace(/[\t]/g, "\\t").replace(/[\r]/g, "\\r").replace(/[\u2028]/g, "\\u2028").replace(/[\u2029]/g, "\\u2029")
        },
        createXhr: p.createXhr ||
        function() {
            var e, t, n;
            if ("undefined" != typeof XMLHttpRequest) return new XMLHttpRequest;
            if ("undefined" != typeof ActiveXObject) for (t = 0; 3 > t; t += 1) {
                n = s[t];
                try {
                    e = new ActiveXObject(n)
                } catch(i) {}
                if (e) {
                    s = [n];
                    break
                }
            }
            return e
        },
        parseName: function(e) {
            var t, n, i, r = !1,
            o = e.indexOf("."),
            s = 0 === e.indexOf("./") || 0 === e.indexOf("../");
            return - 1 !== o && (!s || o > 1) ? (t = e.substring(0, o), n = e.substring(o + 1, e.length)) : t = e,
            i = n || t,
            o = i.indexOf("!"),
            -1 !== o && (r = "strip" === i.substring(o + 1), i = i.substring(0, o), n ? n = i: t = i),
            {
                moduleName: t,
                ext: n,
                strip: r
            }
        },
        xdRegExp: /^((\w+)\:)?\/\/([^\/\\]+)/,
        useXhr: function(e, n, i, r) {
            var o, s, a, u = t.xdRegExp.exec(e);
            return u ? (o = u[2], s = u[3], s = s.split(":"), a = s[1], s = s[0], !(o && o !== n || s && s.toLowerCase() !== i.toLowerCase() || (a || s) && a !== r)) : !0
        },
        finishLoad: function(e, n, i, r) {
            i = n ? t.strip(i) : i,
            p.isBuild && (f[e] = i),
            r(i)
        },
        load: function(e, n, i, r) {
            if (r.isBuild && !r.inlineText) return void i();
            p.isBuild = r.isBuild;
            var o = t.parseName(e),
            s = o.moduleName + (o.ext ? "." + o.ext: ""),
            a = n.toUrl(s),
            u = p.useXhr || t.useXhr;
            return 0 === a.indexOf("empty:") ? void i() : void(!l || u(a, c, d, h) ? t.get(a,
            function(n) {
                t.finishLoad(e, o.strip, n, i)
            },
            function(e) {
                i.error && i.error(e)
            }) : n([s],
            function(e) {
                t.finishLoad(o.moduleName + "." + o.ext, o.strip, e, i)
            }))
        },
        write: function(e, n, i) {
            if (f.hasOwnProperty(n)) {
                var r = t.jsEscape(f[n]);
                i.asModule(e + "!" + n, "define(function () { return '" + r + "';});\n")
            }
        },
        writeFile: function(e, n, i, r, o) {
            var s = t.parseName(n),
            a = s.ext ? "." + s.ext: "",
            u = s.moduleName + a,
            l = i.toUrl(s.moduleName + a) + ".js";
            t.load(u, i,
            function() {
                var n = function(e) {
                    return r(l, e)
                };
                n.asModule = function(e, t) {
                    return r.asModule(e, l, t)
                },
                t.write(e, u, n, o)
            },
            o)
        }
    },
    "node" === p.env || !p.env && "undefined" != typeof process && process.versions && process.versions.node && !process.versions["node-webkit"] ? (n = require.nodeRequire("fs"), t.get = function(e, t, i) {
        try {
            var r = n.readFileSync(e, "utf8");
            0 === r.indexOf("﻿") && (r = r.substring(1)),
            t(r)
        } catch(o) {
            i(o)
        }
    }) : "xhr" === p.env || !p.env && t.createXhr() ? t.get = function(e, n, i, r) {
        var o, s = t.createXhr();
        if (s.open("GET", e, !0), r) for (o in r) r.hasOwnProperty(o) && s.setRequestHeader(o.toLowerCase(), r[o]);
        p.onXhr && p.onXhr(s, e),
        s.onreadystatechange = function() {
            var t, r;
            4 === s.readyState && (t = s.status, t > 399 && 600 > t ? (r = new Error(e + " HTTP status: " + t), r.xhr = s, i(r)) : n(s.responseText), p.onXhrComplete && p.onXhrComplete(s, e))
        },
        s.send(null)
    }: "rhino" === p.env || !p.env && "undefined" != typeof Packages && "undefined" != typeof java ? t.get = function(e, t) {
        var n, i, r = "utf-8",
        o = new java.io.File(e),
        s = java.lang.System.getProperty("line.separator"),
        a = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(o), r)),
        u = "";
        try {
            for (n = new java.lang.StringBuffer, i = a.readLine(), i && i.length() && 65279 === i.charAt(0) && (i = i.substring(1)), null !== i && n.append(i); null !== (i = a.readLine());) n.append(s),
            n.append(i);
            u = String(n.toString())
        } finally {
            a.close()
        }
        t(u)
    }: ("xpconnect" === p.env || !p.env && "undefined" != typeof Components && Components.classes && Components.interfaces) && (i = Components.classes, r = Components.interfaces, Components.utils["import"]("resource://gre/modules/FileUtils.jsm"), o = "@mozilla.org/windows-registry-key;1" in i, t.get = function(e, t) {
        var n, s, a, u = {};
        o && (e = e.replace(/\//g, "\\")),
        a = new FileUtils.File(e);
        try {
            n = i["@mozilla.org/network/file-input-stream;1"].createInstance(r.nsIFileInputStream),
            n.init(a, 1, 0, !1),
            s = i["@mozilla.org/intl/converter-input-stream;1"].createInstance(r.nsIConverterInputStream),
            s.init(n, "utf-8", n.available(), r.nsIConverterInputStream.DEFAULT_REPLACEMENT_CHARACTER),
            s.readString(n.available(), u),
            s.close(),
            n.close(),
            t(u.value)
        } catch(l) {
            throw new Error((a && a.path || "") + ": " + l)
        }
    }),
    t
}),
function(e, t) {
    "object" == typeof module && "object" == typeof module.exports ? module.exports = e.document ? t(e, !0) : function(e) {
        if (!e.document) throw new Error("jQuery requires a window with a document");
        return t(e)
    }: t(e)
} ("undefined" != typeof window ? window: this,
function(e, t) {
    function n(e) {
        var t = e.length,
        n = ot.type(e);
        return "function" === n || ot.isWindow(e) ? !1 : 1 === e.nodeType && t ? !0 : "array" === n || 0 === t || "number" == typeof t && t > 0 && t - 1 in e
    }
    function i(e, t, n) {
        if (ot.isFunction(t)) return ot.grep(e,
        function(e, i) {
            return !! t.call(e, i, e) !== n
        });
        if (t.nodeType) return ot.grep(e,
        function(e) {
            return e === t !== n
        });
        if ("string" == typeof t) {
            if (ft.test(t)) return ot.filter(t, e, n);
            t = ot.filter(t, e)
        }
        return ot.grep(e,
        function(e) {
            return ot.inArray(e, t) >= 0 !== n
        })
    }
    function r(e, t) {
        do e = e[t];
        while (e && 1 !== e.nodeType);
        return e
    }
    function o(e) {
        var t = wt[e] = {};
        return ot.each(e.match(xt) || [],
        function(e, n) {
            t[n] = !0
        }),
        t
    }
    function s() {
        gt.addEventListener ? (gt.removeEventListener("DOMContentLoaded", a, !1), e.removeEventListener("load", a, !1)) : (gt.detachEvent("onreadystatechange", a), e.detachEvent("onload", a))
    }
    function a() { (gt.addEventListener || "load" === event.type || "complete" === gt.readyState) && (s(), ot.ready())
    }
    function u(e, t, n) {
        if (void 0 === n && 1 === e.nodeType) {
            var i = "data-" + t.replace(Tt, "-$1").toLowerCase();
            if (n = e.getAttribute(i), "string" == typeof n) {
                try {
                    n = "true" === n ? !0 : "false" === n ? !1 : "null" === n ? null: +n + "" === n ? +n: Ft.test(n) ? ot.parseJSON(n) : n
                } catch(r) {}
                ot.data(e, t, n)
            } else n = void 0
        }
        return n
    }
    function l(e) {
        var t;
        for (t in e) if (("data" !== t || !ot.isEmptyObject(e[t])) && "toJSON" !== t) return ! 1;
        return ! 0
    }
    function c(e, t, n, i) {
        if (ot.acceptData(e)) {
            var r, o, s = ot.expando,
            a = e.nodeType,
            u = a ? ot.cache: e,
            l = a ? e[s] : e[s] && s;
            if (l && u[l] && (i || u[l].data) || void 0 !== n || "string" != typeof t) return l || (l = a ? e[s] = J.pop() || ot.guid++:s),
            u[l] || (u[l] = a ? {}: {
                toJSON: ot.noop
            }),
            ("object" == typeof t || "function" == typeof t) && (i ? u[l] = ot.extend(u[l], t) : u[l].data = ot.extend(u[l].data, t)),
            o = u[l],
            i || (o.data || (o.data = {}), o = o.data),
            void 0 !== n && (o[ot.camelCase(t)] = n),
            "string" == typeof t ? (r = o[t], null == r && (r = o[ot.camelCase(t)])) : r = o,
            r
        }
    }
    function d(e, t, n) {
        if (ot.acceptData(e)) {
            var i, r, o = e.nodeType,
            s = o ? ot.cache: e,
            a = o ? e[ot.expando] : ot.expando;
            if (s[a]) {
                if (t && (i = n ? s[a] : s[a].data)) {
                    ot.isArray(t) ? t = t.concat(ot.map(t, ot.camelCase)) : t in i ? t = [t] : (t = ot.camelCase(t), t = t in i ? [t] : t.split(" ")),
                    r = t.length;
                    for (; r--;) delete i[t[r]];
                    if (n ? !l(i) : !ot.isEmptyObject(i)) return
                } (n || (delete s[a].data, l(s[a]))) && (o ? ot.cleanData([e], !0) : it.deleteExpando || s != s.window ? delete s[a] : s[a] = null)
            }
        }
    }
    function h() {
        return ! 0
    }
    function f() {
        return ! 1
    }
    function p() {
        try {
            return gt.activeElement
        } catch(e) {}
    }
    function g(e) {
        var t = Ht.split("|"),
        n = e.createDocumentFragment();
        if (n.createElement) for (; t.length;) n.createElement(t.pop());
        return n
    }
    function m(e, t) {
        var n, i, r = 0,
        o = typeof e.getElementsByTagName !== Et ? e.getElementsByTagName(t || "*") : typeof e.querySelectorAll !== Et ? e.querySelectorAll(t || "*") : void 0;
        if (!o) for (o = [], n = e.childNodes || e; null != (i = n[r]); r++) ! t || ot.nodeName(i, t) ? o.push(i) : ot.merge(o, m(i, t));
        return void 0 === t || t && ot.nodeName(e, t) ? ot.merge([e], o) : o
    }
    function v(e) {
        At.test(e.type) && (e.defaultChecked = e.checked)
    }
    function y(e, t) {
        return ot.nodeName(e, "table") && ot.nodeName(11 !== t.nodeType ? t: t.firstChild, "tr") ? e.getElementsByTagName("tbody")[0] || e.appendChild(e.ownerDocument.createElement("tbody")) : e
    }
    function b(e) {
        return e.type = (null !== ot.find.attr(e, "type")) + "/" + e.type,
        e
    }
    function x(e) {
        var t = Jt.exec(e.type);
        return t ? e.type = t[1] : e.removeAttribute("type"),
        e
    }
    function w(e, t) {
        for (var n, i = 0; null != (n = e[i]); i++) ot._data(n, "globalEval", !t || ot._data(t[i], "globalEval"))
    }
    function C(e, t) {
        if (1 === t.nodeType && ot.hasData(e)) {
            var n, i, r, o = ot._data(e),
            s = ot._data(t, o),
            a = o.events;
            if (a) {
                delete s.handle,
                s.events = {};
                for (n in a) for (i = 0, r = a[n].length; r > i; i++) ot.event.add(t, n, a[n][i])
            }
            s.data && (s.data = ot.extend({},
            s.data))
        }
    }
    function _(e, t) {
        var n, i, r;
        if (1 === t.nodeType) {
            if (n = t.nodeName.toLowerCase(), !it.noCloneEvent && t[ot.expando]) {
                r = ot._data(t);
                for (i in r.events) ot.removeEvent(t, i, r.handle);
                t.removeAttribute(ot.expando)
            }
            "script" === n && t.text !== e.text ? (b(t).text = e.text, x(t)) : "object" === n ? (t.parentNode && (t.outerHTML = e.outerHTML), it.html5Clone && e.innerHTML && !ot.trim(t.innerHTML) && (t.innerHTML = e.innerHTML)) : "input" === n && At.test(e.type) ? (t.defaultChecked = t.checked = e.checked, t.value !== e.value && (t.value = e.value)) : "option" === n ? t.defaultSelected = t.selected = e.defaultSelected: ("input" === n || "textarea" === n) && (t.defaultValue = e.defaultValue)
        }
    }
    function E(t, n) {
        var i = ot(n.createElement(t)).appendTo(n.body),
        r = e.getDefaultComputedStyle ? e.getDefaultComputedStyle(i[0]).display: ot.css(i[0], "display");
        return i.detach(),
        r
    }
    function F(e) {
        var t = gt,
        n = en[e];
        return n || (n = E(e, t), "none" !== n && n || (Zt = (Zt || ot("<iframe frameborder='0' width='0' height='0'/>")).appendTo(t.documentElement), t = (Zt[0].contentWindow || Zt[0].contentDocument).document, t.write(), t.close(), n = E(e, t), Zt.detach()), en[e] = n),
        n
    }
    function T(e, t) {
        return {
            get: function() {
                var n = e();
                if (null != n) return n ? void delete this.get: (this.get = t).apply(this, arguments)
            }
        }
    }
    function k(e, t) {
        if (t in e) return t;
        for (var n = t.charAt(0).toUpperCase() + t.slice(1), i = t, r = pn.length; r--;) if (t = pn[r] + n, t in e) return t;
        return i
    }
    function S(e, t) {
        for (var n, i, r, o = [], s = 0, a = e.length; a > s; s++) i = e[s],
        i.style && (o[s] = ot._data(i, "olddisplay"), n = i.style.display, t ? (o[s] || "none" !== n || (i.style.display = ""), "" === i.style.display && Nt(i) && (o[s] = ot._data(i, "olddisplay", F(i.nodeName)))) : o[s] || (r = Nt(i), (n && "none" !== n || !r) && ot._data(i, "olddisplay", r ? n: ot.css(i, "display"))));
        for (s = 0; a > s; s++) i = e[s],
        i.style && (t && "none" !== i.style.display && "" !== i.style.display || (i.style.display = t ? o[s] || "": "none"));
        return e
    }
    function N(e, t, n) {
        var i = cn.exec(t);
        return i ? Math.max(0, i[1] - (n || 0)) + (i[2] || "px") : t
    }
    function j(e, t, n, i, r) {
        for (var o = n === (i ? "border": "content") ? 4 : "width" === t ? 1 : 0, s = 0; 4 > o; o += 2)"margin" === n && (s += ot.css(e, n + St[o], !0, r)),
        i ? ("content" === n && (s -= ot.css(e, "padding" + St[o], !0, r)), "margin" !== n && (s -= ot.css(e, "border" + St[o] + "Width", !0, r))) : (s += ot.css(e, "padding" + St[o], !0, r), "padding" !== n && (s += ot.css(e, "border" + St[o] + "Width", !0, r)));
        return s
    }
    function A(e, t, n) {
        var i = !0,
        r = "width" === t ? e.offsetWidth: e.offsetHeight,
        o = tn(e),
        s = it.boxSizing() && "border-box" === ot.css(e, "boxSizing", !1, o);
        if (0 >= r || null == r) {
            if (r = nn(e, t, o), (0 > r || null == r) && (r = e.style[t]), on.test(r)) return r;
            i = s && (it.boxSizingReliable() || r === e.style[t]),
            r = parseFloat(r) || 0
        }
        return r + j(e, t, n || (s ? "border": "content"), i, o) + "px"
    }
    function D(e, t, n, i, r) {
        return new D.prototype.init(e, t, n, i, r)
    }
    function M() {
        return setTimeout(function() {
            gn = void 0
        }),
        gn = ot.now()
    }
    function R(e, t) {
        var n, i = {
            height: e
        },
        r = 0;
        for (t = t ? 1 : 0; 4 > r; r += 2 - t) n = St[r],
        i["margin" + n] = i["padding" + n] = e;
        return t && (i.opacity = i.width = e),
        i
    }
    function L(e, t, n) {
        for (var i, r = (wn[t] || []).concat(wn["*"]), o = 0, s = r.length; s > o; o++) if (i = r[o].call(n, t, e)) return i
    }
    function q(e, t, n) {
        var i, r, o, s, a, u, l, c, d = this,
        h = {},
        f = e.style,
        p = e.nodeType && Nt(e),
        g = ot._data(e, "fxshow");
        n.queue || (a = ot._queueHooks(e, "fx"), null == a.unqueued && (a.unqueued = 0, u = a.empty.fire, a.empty.fire = function() {
            a.unqueued || u()
        }), a.unqueued++, d.always(function() {
            d.always(function() {
                a.unqueued--,
                ot.queue(e, "fx").length || a.empty.fire()
            })
        })),
        1 === e.nodeType && ("height" in t || "width" in t) && (n.overflow = [f.overflow, f.overflowX, f.overflowY], l = ot.css(e, "display"), c = F(e.nodeName), "none" === l && (l = c), "inline" === l && "none" === ot.css(e, "float") && (it.inlineBlockNeedsLayout && "inline" !== c ? f.zoom = 1 : f.display = "inline-block")),
        n.overflow && (f.overflow = "hidden", it.shrinkWrapBlocks() || d.always(function() {
            f.overflow = n.overflow[0],
            f.overflowX = n.overflow[1],
            f.overflowY = n.overflow[2]
        }));
        for (i in t) if (r = t[i], vn.exec(r)) {
            if (delete t[i], o = o || "toggle" === r, r === (p ? "hide": "show")) {
                if ("show" !== r || !g || void 0 === g[i]) continue;
                p = !0
            }
            h[i] = g && g[i] || ot.style(e, i)
        }
        if (!ot.isEmptyObject(h)) {
            g ? "hidden" in g && (p = g.hidden) : g = ot._data(e, "fxshow", {}),
            o && (g.hidden = !p),
            p ? ot(e).show() : d.done(function() {
                ot(e).hide()
            }),
            d.done(function() {
                var t;
                ot._removeData(e, "fxshow");
                for (t in h) ot.style(e, t, h[t])
            });
            for (i in h) s = L(p ? g[i] : 0, i, d),
            i in g || (g[i] = s.start, p && (s.end = s.start, s.start = "width" === i || "height" === i ? 1 : 0))
        }
    }
    function H(e, t) {
        var n, i, r, o, s;
        for (n in e) if (i = ot.camelCase(n), r = t[i], o = e[n], ot.isArray(o) && (r = o[1], o = e[n] = o[0]), n !== i && (e[i] = o, delete e[n]), s = ot.cssHooks[i], s && "expand" in s) {
            o = s.expand(o),
            delete e[i];
            for (n in o) n in e || (e[n] = o[n], t[n] = r)
        } else t[i] = r
    }
    function O(e, t, n) {
        var i, r, o = 0,
        s = xn.length,
        a = ot.Deferred().always(function() {
            delete u.elem
        }),
        u = function() {
            if (r) return ! 1;
            for (var t = gn || M(), n = Math.max(0, l.startTime + l.duration - t), i = n / l.duration || 0, o = 1 - i, s = 0, u = l.tweens.length; u > s; s++) l.tweens[s].run(o);
            return a.notifyWith(e, [l, o, n]),
            1 > o && u ? n: (a.resolveWith(e, [l]), !1)
        },
        l = a.promise({
            elem: e,
            props: ot.extend({},
            t),
            opts: ot.extend(!0, {
                specialEasing: {}
            },
            n),
            originalProperties: t,
            originalOptions: n,
            startTime: gn || M(),
            duration: n.duration,
            tweens: [],
            createTween: function(t, n) {
                var i = ot.Tween(e, l.opts, t, n, l.opts.specialEasing[t] || l.opts.easing);
                return l.tweens.push(i),
                i
            },
            stop: function(t) {
                var n = 0,
                i = t ? l.tweens.length: 0;
                if (r) return this;
                for (r = !0; i > n; n++) l.tweens[n].run(1);
                return t ? a.resolveWith(e, [l, t]) : a.rejectWith(e, [l, t]),
                this
            }
        }),
        c = l.props;
        for (H(c, l.opts.specialEasing); s > o; o++) if (i = xn[o].call(l, e, c, l.opts)) return i;
        return ot.map(c, L, l),
        ot.isFunction(l.opts.start) && l.opts.start.call(e, l),
        ot.fx.timer(ot.extend(u, {
            elem: e,
            anim: l,
            queue: l.opts.queue
        })),
        l.progress(l.opts.progress).done(l.opts.done, l.opts.complete).fail(l.opts.fail).always(l.opts.always)
    }
    function I(e) {
        return function(t, n) {
            "string" != typeof t && (n = t, t = "*");
            var i, r = 0,
            o = t.toLowerCase().match(xt) || [];
            if (ot.isFunction(n)) for (; i = o[r++];)"+" === i.charAt(0) ? (i = i.slice(1) || "*", (e[i] = e[i] || []).unshift(n)) : (e[i] = e[i] || []).push(n)
        }
    }
    function B(e, t, n, i) {
        function r(a) {
            var u;
            return o[a] = !0,
            ot.each(e[a] || [],
            function(e, a) {
                var l = a(t, n, i);
                return "string" != typeof l || s || o[l] ? s ? !(u = l) : void 0 : (t.dataTypes.unshift(l), r(l), !1)
            }),
            u
        }
        var o = {},
        s = e === Wn;
        return r(t.dataTypes[0]) || !o["*"] && r("*")
    }
    function z(e, t) {
        var n, i, r = ot.ajaxSettings.flatOptions || {};
        for (i in t) void 0 !== t[i] && ((r[i] ? e: n || (n = {}))[i] = t[i]);
        return n && ot.extend(!0, e, n),
        e
    }
    function P(e, t, n) {
        for (var i, r, o, s, a = e.contents,
        u = e.dataTypes;
        "*" === u[0];) u.shift(),
        void 0 === r && (r = e.mimeType || t.getResponseHeader("Content-Type"));
        if (r) for (s in a) if (a[s] && a[s].test(r)) {
            u.unshift(s);
            break
        }
        if (u[0] in n) o = u[0];
        else {
            for (s in n) {
                if (!u[0] || e.converters[s + " " + u[0]]) {
                    o = s;
                    break
                }
                i || (i = s)
            }
            o = o || i
        }
        return o ? (o !== u[0] && u.unshift(o), n[o]) : void 0
    }
    function $(e, t, n, i) {
        var r, o, s, a, u, l = {},
        c = e.dataTypes.slice();
        if (c[1]) for (s in e.converters) l[s.toLowerCase()] = e.converters[s];
        for (o = c.shift(); o;) if (e.responseFields[o] && (n[e.responseFields[o]] = t), !u && i && e.dataFilter && (t = e.dataFilter(t, e.dataType)), u = o, o = c.shift()) if ("*" === o) o = u;
        else if ("*" !== u && u !== o) {
            if (s = l[u + " " + o] || l["* " + o], !s) for (r in l) if (a = r.split(" "), a[1] === o && (s = l[u + " " + a[0]] || l["* " + a[0]])) {
                s === !0 ? s = l[r] : l[r] !== !0 && (o = a[0], c.unshift(a[1]));
                break
            }
            if (s !== !0) if (s && e["throws"]) t = s(t);
            else try {
                t = s(t)
            } catch(d) {
                return {
                    state: "parsererror",
                    error: s ? d: "No conversion from " + u + " to " + o
                }
            }
        }
        return {
            state: "success",
            data: t
        }
    }
    function V(e, t, n, i) {
        var r;
        if (ot.isArray(t)) ot.each(t,
        function(t, r) {
            n || Qn.test(e) ? i(e, r) : V(e + "[" + ("object" == typeof r ? t: "") + "]", r, n, i)
        });
        else if (n || "object" !== ot.type(t)) i(e, t);
        else for (r in t) V(e + "[" + r + "]", t[r], n, i)
    }
    function W() {
        try {
            return new e.XMLHttpRequest
        } catch(t) {}
    }
    function U() {
        try {
            return new e.ActiveXObject("Microsoft.XMLHTTP")
        } catch(t) {}
    }
    function X(e) {
        return ot.isWindow(e) ? e: 9 === e.nodeType ? e.defaultView || e.parentWindow: !1
    }
    var J = [],
    Q = J.slice,
    G = J.concat,
    Y = J.push,
    K = J.indexOf,
    Z = {},
    et = Z.toString,
    tt = Z.hasOwnProperty,
    nt = "".trim,
    it = {},
    rt = "1.11.0",
    ot = function(e, t) {
        return new ot.fn.init(e, t)
    },
    st = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,
    at = /^-ms-/,
    ut = /-([\da-z])/gi,
    lt = function(e, t) {
        return t.toUpperCase()
    };
    ot.fn = ot.prototype = {
        jquery: rt,
        constructor: ot,
        selector: "",
        length: 0,
        toArray: function() {
            return Q.call(this)
        },
        get: function(e) {
            return null != e ? 0 > e ? this[e + this.length] : this[e] : Q.call(this)
        },
        pushStack: function(e) {
            var t = ot.merge(this.constructor(), e);
            return t.prevObject = this,
            t.context = this.context,
            t
        },
        each: function(e, t) {
            return ot.each(this, e, t)
        },
        map: function(e) {
            return this.pushStack(ot.map(this,
            function(t, n) {
                return e.call(t, n, t)
            }))
        },
        slice: function() {
            return this.pushStack(Q.apply(this, arguments))
        },
        first: function() {
            return this.eq(0)
        },
        last: function() {
            return this.eq( - 1)
        },
        eq: function(e) {
            var t = this.length,
            n = +e + (0 > e ? t: 0);
            return this.pushStack(n >= 0 && t > n ? [this[n]] : [])
        },
        end: function() {
            return this.prevObject || this.constructor(null)
        },
        push: Y,
        sort: J.sort,
        splice: J.splice
    },
    ot.extend = ot.fn.extend = function() {
        var e, t, n, i, r, o, s = arguments[0] || {},
        a = 1,
        u = arguments.length,
        l = !1;
        for ("boolean" == typeof s && (l = s, s = arguments[a] || {},
        a++), "object" == typeof s || ot.isFunction(s) || (s = {}), a === u && (s = this, a--); u > a; a++) if (null != (r = arguments[a])) for (i in r) e = s[i],
        n = r[i],
        s !== n && (l && n && (ot.isPlainObject(n) || (t = ot.isArray(n))) ? (t ? (t = !1, o = e && ot.isArray(e) ? e: []) : o = e && ot.isPlainObject(e) ? e: {},
        s[i] = ot.extend(l, o, n)) : void 0 !== n && (s[i] = n));
        return s
    },
    ot.extend({
        expando: "jQuery" + (rt + Math.random()).replace(/\D/g, ""),
        isReady: !0,
        error: function(e) {
            throw new Error(e)
        },
        noop: function() {},
        isFunction: function(e) {
            return "function" === ot.type(e)
        },
        isArray: Array.isArray ||
        function(e) {
            return "array" === ot.type(e)
        },
        isWindow: function(e) {
            return null != e && e == e.window
        },
        isNumeric: function(e) {
            return e - parseFloat(e) >= 0
        },
        isEmptyObject: function(e) {
            var t;
            for (t in e) return ! 1;
            return ! 0
        },
        isPlainObject: function(e) {
            var t;
            if (!e || "object" !== ot.type(e) || e.nodeType || ot.isWindow(e)) return ! 1;
            try {
                if (e.constructor && !tt.call(e, "constructor") && !tt.call(e.constructor.prototype, "isPrototypeOf")) return ! 1
            } catch(n) {
                return ! 1
            }
            if (it.ownLast) for (t in e) return tt.call(e, t);
            for (t in e);
            return void 0 === t || tt.call(e, t)
        },
        type: function(e) {
            return null == e ? e + "": "object" == typeof e || "function" == typeof e ? Z[et.call(e)] || "object": typeof e
        },
        globalEval: function(t) {
            t && ot.trim(t) && (e.execScript ||
            function(t) {
                e.eval.call(e, t)
            })(t)
        },
        camelCase: function(e) {
            return e.replace(at, "ms-").replace(ut, lt)
        },
        nodeName: function(e, t) {
            return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase()
        },
        each: function(e, t, i) {
            var r, o = 0,
            s = e.length,
            a = n(e);
            if (i) {
                if (a) for (; s > o && (r = t.apply(e[o], i), r !== !1); o++);
                else for (o in e) if (r = t.apply(e[o], i), r === !1) break
            } else if (a) for (; s > o && (r = t.call(e[o], o, e[o]), r !== !1); o++);
            else for (o in e) if (r = t.call(e[o], o, e[o]), r === !1) break;
            return e
        },
        trim: nt && !nt.call("﻿ ") ?
        function(e) {
            return null == e ? "": nt.call(e)
        }: function(e) {
            return null == e ? "": (e + "").replace(st, "")
        },
        makeArray: function(e, t) {
            var i = t || [];
            return null != e && (n(Object(e)) ? ot.merge(i, "string" == typeof e ? [e] : e) : Y.call(i, e)),
            i
        },
        inArray: function(e, t, n) {
            var i;
            if (t) {
                if (K) return K.call(t, e, n);
                for (i = t.length, n = n ? 0 > n ? Math.max(0, i + n) : n: 0; i > n; n++) if (n in t && t[n] === e) return n
            }
            return - 1
        },
        merge: function(e, t) {
            for (var n = +t.length,
            i = 0,
            r = e.length; n > i;) e[r++] = t[i++];
            if (n !== n) for (; void 0 !== t[i];) e[r++] = t[i++];
            return e.length = r,
            e
        },
        grep: function(e, t, n) {
            for (var i, r = [], o = 0, s = e.length, a = !n; s > o; o++) i = !t(e[o], o),
            i !== a && r.push(e[o]);
            return r
        },
        map: function(e, t, i) {
            var r, o = 0,
            s = e.length,
            a = n(e),
            u = [];
            if (a) for (; s > o; o++) r = t(e[o], o, i),
            null != r && u.push(r);
            else for (o in e) r = t(e[o], o, i),
            null != r && u.push(r);
            return G.apply([], u)
        },
        guid: 1,
        proxy: function(e, t) {
            var n, i, r;
            return "string" == typeof t && (r = e[t], t = e, e = r),
            ot.isFunction(e) ? (n = Q.call(arguments, 2), i = function() {
                return e.apply(t || this, n.concat(Q.call(arguments)))
            },
            i.guid = e.guid = e.guid || ot.guid++, i) : void 0
        },
        now: function() {
            return + new Date
        },
        support: it
    }),
    ot.each("Boolean Number String Function Array Date RegExp Object Error".split(" "),
    function(e, t) {
        Z["[object " + t + "]"] = t.toLowerCase()
    });
    var ct = function(e) {
        function t(e, t, n, i) {
            var r, o, s, a, u, l, d, p, g, m;
            if ((t ? t.ownerDocument || t: B) !== D && A(t), t = t || D, n = n || [], !e || "string" != typeof e) return n;
            if (1 !== (a = t.nodeType) && 9 !== a) return [];
            if (R && !i) {
                if (r = yt.exec(e)) if (s = r[1]) {
                    if (9 === a) {
                        if (o = t.getElementById(s), !o || !o.parentNode) return n;
                        if (o.id === s) return n.push(o),
                        n
                    } else if (t.ownerDocument && (o = t.ownerDocument.getElementById(s)) && O(t, o) && o.id === s) return n.push(o),
                    n
                } else {
                    if (r[2]) return Z.apply(n, t.getElementsByTagName(e)),
                    n;
                    if ((s = r[3]) && _.getElementsByClassName && t.getElementsByClassName) return Z.apply(n, t.getElementsByClassName(s)),
                    n
                }
                if (_.qsa && (!L || !L.test(e))) {
                    if (p = d = I, g = t, m = 9 === a && e, 1 === a && "object" !== t.nodeName.toLowerCase()) {
                        for (l = h(e), (d = t.getAttribute("id")) ? p = d.replace(xt, "\\$&") : t.setAttribute("id", p), p = "[id='" + p + "'] ", u = l.length; u--;) l[u] = p + f(l[u]);
                        g = bt.test(e) && c(t.parentNode) || t,
                        m = l.join(",")
                    }
                    if (m) try {
                        return Z.apply(n, g.querySelectorAll(m)),
                        n
                    } catch(v) {} finally {
                        d || t.removeAttribute("id")
                    }
                }
            }
            return w(e.replace(ut, "$1"), t, n, i)
        }
        function n() {
            function e(n, i) {
                return t.push(n + " ") > E.cacheLength && delete e[t.shift()],
                e[n + " "] = i
            }
            var t = [];
            return e
        }
        function i(e) {
            return e[I] = !0,
            e
        }
        function r(e) {
            var t = D.createElement("div");
            try {
                return !! e(t)
            } catch(n) {
                return ! 1
            } finally {
                t.parentNode && t.parentNode.removeChild(t),
                t = null
            }
        }
        function o(e, t) {
            for (var n = e.split("|"), i = e.length; i--;) E.attrHandle[n[i]] = t
        }
        function s(e, t) {
            var n = t && e,
            i = n && 1 === e.nodeType && 1 === t.nodeType && (~t.sourceIndex || J) - (~e.sourceIndex || J);
            if (i) return i;
            if (n) for (; n = n.nextSibling;) if (n === t) return - 1;
            return e ? 1 : -1
        }
        function a(e) {
            return function(t) {
                var n = t.nodeName.toLowerCase();
                return "input" === n && t.type === e
            }
        }
        function u(e) {
            return function(t) {
                var n = t.nodeName.toLowerCase();
                return ("input" === n || "button" === n) && t.type === e
            }
        }
        function l(e) {
            return i(function(t) {
                return t = +t,
                i(function(n, i) {
                    for (var r, o = e([], n.length, t), s = o.length; s--;) n[r = o[s]] && (n[r] = !(i[r] = n[r]))
                })
            })
        }
        function c(e) {
            return e && typeof e.getElementsByTagName !== X && e
        }
        function d() {}
        function h(e, n) {
            var i, r, o, s, a, u, l, c = V[e + " "];
            if (c) return n ? 0 : c.slice(0);
            for (a = e, u = [], l = E.preFilter; a;) { (!i || (r = lt.exec(a))) && (r && (a = a.slice(r[0].length) || a), u.push(o = [])),
                i = !1,
                (r = ct.exec(a)) && (i = r.shift(), o.push({
                    value: i,
                    type: r[0].replace(ut, " ")
                }), a = a.slice(i.length));
                for (s in E.filter) ! (r = pt[s].exec(a)) || l[s] && !(r = l[s](r)) || (i = r.shift(), o.push({
                    value: i,
                    type: s,
                    matches: r
                }), a = a.slice(i.length));
                if (!i) break
            }
            return n ? a.length: a ? t.error(e) : V(e, u).slice(0)
        }
        function f(e) {
            for (var t = 0,
            n = e.length,
            i = ""; n > t; t++) i += e[t].value;
            return i
        }
        function p(e, t, n) {
            var i = t.dir,
            r = n && "parentNode" === i,
            o = P++;
            return t.first ?
            function(t, n, o) {
                for (; t = t[i];) if (1 === t.nodeType || r) return e(t, n, o)
            }: function(t, n, s) {
                var a, u, l = [z, o];
                if (s) {
                    for (; t = t[i];) if ((1 === t.nodeType || r) && e(t, n, s)) return ! 0
                } else for (; t = t[i];) if (1 === t.nodeType || r) {
                    if (u = t[I] || (t[I] = {}), (a = u[i]) && a[0] === z && a[1] === o) return l[2] = a[2];
                    if (u[i] = l, l[2] = e(t, n, s)) return ! 0
                }
            }
        }
        function g(e) {
            return e.length > 1 ?
            function(t, n, i) {
                for (var r = e.length; r--;) if (!e[r](t, n, i)) return ! 1;
                return ! 0
            }: e[0]
        }
        function m(e, t, n, i, r) {
            for (var o, s = [], a = 0, u = e.length, l = null != t; u > a; a++)(o = e[a]) && (!n || n(o, i, r)) && (s.push(o), l && t.push(a));
            return s
        }
        function v(e, t, n, r, o, s) {
            return r && !r[I] && (r = v(r)),
            o && !o[I] && (o = v(o, s)),
            i(function(i, s, a, u) {
                var l, c, d, h = [],
                f = [],
                p = s.length,
                g = i || x(t || "*", a.nodeType ? [a] : a, []),
                v = !e || !i && t ? g: m(g, h, e, a, u),
                y = n ? o || (i ? e: p || r) ? [] : s: v;
                if (n && n(v, y, a, u), r) for (l = m(y, f), r(l, [], a, u), c = l.length; c--;)(d = l[c]) && (y[f[c]] = !(v[f[c]] = d));
                if (i) {
                    if (o || e) {
                        if (o) {
                            for (l = [], c = y.length; c--;)(d = y[c]) && l.push(v[c] = d);
                            o(null, y = [], l, u)
                        }
                        for (c = y.length; c--;)(d = y[c]) && (l = o ? tt.call(i, d) : h[c]) > -1 && (i[l] = !(s[l] = d))
                    }
                } else y = m(y === s ? y.splice(p, y.length) : y),
                o ? o(null, s, y, u) : Z.apply(s, y)
            })
        }
        function y(e) {
            for (var t, n, i, r = e.length,
            o = E.relative[e[0].type], s = o || E.relative[" "], a = o ? 1 : 0, u = p(function(e) {
                return e === t
            },
            s, !0), l = p(function(e) {
                return tt.call(t, e) > -1
            },
            s, !0), c = [function(e, n, i) {
                return ! o && (i || n !== S) || ((t = n).nodeType ? u(e, n, i) : l(e, n, i))
            }]; r > a; a++) if (n = E.relative[e[a].type]) c = [p(g(c), n)];
            else {
                if (n = E.filter[e[a].type].apply(null, e[a].matches), n[I]) {
                    for (i = ++a; r > i && !E.relative[e[i].type]; i++);
                    return v(a > 1 && g(c), a > 1 && f(e.slice(0, a - 1).concat({
                        value: " " === e[a - 2].type ? "*": ""
                    })).replace(ut, "$1"), n, i > a && y(e.slice(a, i)), r > i && y(e = e.slice(i)), r > i && f(e))
                }
                c.push(n)
            }
            return g(c)
        }
        function b(e, n) {
            var r = n.length > 0,
            o = e.length > 0,
            s = function(i, s, a, u, l) {
                var c, d, h, f = 0,
                p = "0",
                g = i && [],
                v = [],
                y = S,
                b = i || o && E.find.TAG("*", l),
                x = z += null == y ? 1 : Math.random() || .1,
                w = b.length;
                for (l && (S = s !== D && s); p !== w && null != (c = b[p]); p++) {
                    if (o && c) {
                        for (d = 0; h = e[d++];) if (h(c, s, a)) {
                            u.push(c);
                            break
                        }
                        l && (z = x)
                    }
                    r && ((c = !h && c) && f--, i && g.push(c))
                }
                if (f += p, r && p !== f) {
                    for (d = 0; h = n[d++];) h(g, v, s, a);
                    if (i) {
                        if (f > 0) for (; p--;) g[p] || v[p] || (v[p] = Y.call(u));
                        v = m(v)
                    }
                    Z.apply(u, v),
                    l && !i && v.length > 0 && f + n.length > 1 && t.uniqueSort(u)
                }
                return l && (z = x, S = y),
                g
            };
            return r ? i(s) : s
        }
        function x(e, n, i) {
            for (var r = 0,
            o = n.length; o > r; r++) t(e, n[r], i);
            return i
        }
        function w(e, t, n, i) {
            var r, o, s, a, u, l = h(e);
            if (!i && 1 === l.length) {
                if (o = l[0] = l[0].slice(0), o.length > 2 && "ID" === (s = o[0]).type && _.getById && 9 === t.nodeType && R && E.relative[o[1].type]) {
                    if (t = (E.find.ID(s.matches[0].replace(wt, Ct), t) || [])[0], !t) return n;
                    e = e.slice(o.shift().value.length)
                }
                for (r = pt.needsContext.test(e) ? 0 : o.length; r--&&(s = o[r], !E.relative[a = s.type]);) if ((u = E.find[a]) && (i = u(s.matches[0].replace(wt, Ct), bt.test(o[0].type) && c(t.parentNode) || t))) {
                    if (o.splice(r, 1), e = i.length && f(o), !e) return Z.apply(n, i),
                    n;
                    break
                }
            }
            return k(e, l)(i, t, !R, n, bt.test(e) && c(t.parentNode) || t),
            n
        }
        var C, _, E, F, T, k, S, N, j, A, D, M, R, L, q, H, O, I = "sizzle" + -new Date,
        B = e.document,
        z = 0,
        P = 0,
        $ = n(),
        V = n(),
        W = n(),
        U = function(e, t) {
            return e === t && (j = !0),
            0
        },
        X = "undefined",
        J = 1 << 31,
        Q = {}.hasOwnProperty,
        G = [],
        Y = G.pop,
        K = G.push,
        Z = G.push,
        et = G.slice,
        tt = G.indexOf ||
        function(e) {
            for (var t = 0,
            n = this.length; n > t; t++) if (this[t] === e) return t;
            return - 1
        },
        nt = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",
        it = "[\\x20\\t\\r\\n\\f]",
        rt = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",
        ot = rt.replace("w", "w#"),
        st = "\\[" + it + "*(" + rt + ")" + it + "*(?:([*^$|!~]?=)" + it + "*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|(" + ot + ")|)|)" + it + "*\\]",
        at = ":(" + rt + ")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|" + st.replace(3, 8) + ")*)|.*)\\)|)",
        ut = new RegExp("^" + it + "+|((?:^|[^\\\\])(?:\\\\.)*)" + it + "+$", "g"),
        lt = new RegExp("^" + it + "*," + it + "*"),
        ct = new RegExp("^" + it + "*([>+~]|" + it + ")" + it + "*"),
        dt = new RegExp("=" + it + "*([^\\]'\"]*?)" + it + "*\\]", "g"),
        ht = new RegExp(at),
        ft = new RegExp("^" + ot + "$"),
        pt = {
            ID: new RegExp("^#(" + rt + ")"),
            CLASS: new RegExp("^\\.(" + rt + ")"),
            TAG: new RegExp("^(" + rt.replace("w", "w*") + ")"),
            ATTR: new RegExp("^" + st),
            PSEUDO: new RegExp("^" + at),
            CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + it + "*(even|odd|(([+-]|)(\\d*)n|)" + it + "*(?:([+-]|)" + it + "*(\\d+)|))" + it + "*\\)|)", "i"),
            bool: new RegExp("^(?:" + nt + ")$", "i"),
            needsContext: new RegExp("^" + it + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + it + "*((?:-\\d)?\\d*)" + it + "*\\)|)(?=[^-]|$)", "i")
        },
        gt = /^(?:input|select|textarea|button)$/i,
        mt = /^h\d$/i,
        vt = /^[^{]+\{\s*\[native \w/,
        yt = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,
        bt = /[+~]/,
        xt = /'|\\/g,
        wt = new RegExp("\\\\([\\da-f]{1,6}" + it + "?|(" + it + ")|.)", "ig"),
        Ct = function(e, t, n) {
            var i = "0x" + t - 65536;
            return i !== i || n ? t: 0 > i ? String.fromCharCode(i + 65536) : String.fromCharCode(i >> 10 | 55296, 1023 & i | 56320)
        };
        try {
            Z.apply(G = et.call(B.childNodes), B.childNodes),
            G[B.childNodes.length].nodeType
        } catch(_t) {
            Z = {
                apply: G.length ?
                function(e, t) {
                    K.apply(e, et.call(t))
                }: function(e, t) {
                    for (var n = e.length,
                    i = 0; e[n++] = t[i++];);
                    e.length = n - 1
                }
            }
        }
        _ = t.support = {},
        T = t.isXML = function(e) {
            var t = e && (e.ownerDocument || e).documentElement;
            return t ? "HTML" !== t.nodeName: !1
        },
        A = t.setDocument = function(e) {
            var t, n = e ? e.ownerDocument || e: B,
            i = n.defaultView;
            return n !== D && 9 === n.nodeType && n.documentElement ? (D = n, M = n.documentElement, R = !T(n), i && i !== i.top && (i.addEventListener ? i.addEventListener("unload",
            function() {
                A()
            },
            !1) : i.attachEvent && i.attachEvent("onunload",
            function() {
                A()
            })), _.attributes = r(function(e) {
                return e.className = "i",
                !e.getAttribute("className")
            }), _.getElementsByTagName = r(function(e) {
                return e.appendChild(n.createComment("")),
                !e.getElementsByTagName("*").length
            }), _.getElementsByClassName = vt.test(n.getElementsByClassName) && r(function(e) {
                return e.innerHTML = "<div class='a'></div><div class='a i'></div>",
                e.firstChild.className = "i",
                2 === e.getElementsByClassName("i").length
            }), _.getById = r(function(e) {
                return M.appendChild(e).id = I,
                !n.getElementsByName || !n.getElementsByName(I).length
            }), _.getById ? (E.find.ID = function(e, t) {
                if (typeof t.getElementById !== X && R) {
                    var n = t.getElementById(e);
                    return n && n.parentNode ? [n] : []
                }
            },
            E.filter.ID = function(e) {
                var t = e.replace(wt, Ct);
                return function(e) {
                    return e.getAttribute("id") === t
                }
            }) : (delete E.find.ID, E.filter.ID = function(e) {
                var t = e.replace(wt, Ct);
                return function(e) {
                    var n = typeof e.getAttributeNode !== X && e.getAttributeNode("id");
                    return n && n.value === t
                }
            }), E.find.TAG = _.getElementsByTagName ?
            function(e, t) {
                return typeof t.getElementsByTagName !== X ? t.getElementsByTagName(e) : void 0
            }: function(e, t) {
                var n, i = [],
                r = 0,
                o = t.getElementsByTagName(e);
                if ("*" === e) {
                    for (; n = o[r++];) 1 === n.nodeType && i.push(n);
                    return i
                }
                return o
            },
            E.find.CLASS = _.getElementsByClassName &&
            function(e, t) {
                return typeof t.getElementsByClassName !== X && R ? t.getElementsByClassName(e) : void 0
            },
            q = [], L = [], (_.qsa = vt.test(n.querySelectorAll)) && (r(function(e) {
                e.innerHTML = "<select t=''><option selected=''></option></select>",
                e.querySelectorAll("[t^='']").length && L.push("[*^$]=" + it + "*(?:''|\"\")"),
                e.querySelectorAll("[selected]").length || L.push("\\[" + it + "*(?:value|" + nt + ")"),
                e.querySelectorAll(":checked").length || L.push(":checked")
            }), r(function(e) {
                var t = n.createElement("input");
                t.setAttribute("type", "hidden"),
                e.appendChild(t).setAttribute("name", "D"),
                e.querySelectorAll("[name=d]").length && L.push("name" + it + "*[*^$|!~]?="),
                e.querySelectorAll(":enabled").length || L.push(":enabled", ":disabled"),
                e.querySelectorAll("*,:x"),
                L.push(",.*:")
            })), (_.matchesSelector = vt.test(H = M.webkitMatchesSelector || M.mozMatchesSelector || M.oMatchesSelector || M.msMatchesSelector)) && r(function(e) {
                _.disconnectedMatch = H.call(e, "div"),
                H.call(e, "[s!='']:x"),
                q.push("!=", at)
            }), L = L.length && new RegExp(L.join("|")), q = q.length && new RegExp(q.join("|")), t = vt.test(M.compareDocumentPosition), O = t || vt.test(M.contains) ?
            function(e, t) {
                var n = 9 === e.nodeType ? e.documentElement: e,
                i = t && t.parentNode;
                return e === i || !(!i || 1 !== i.nodeType || !(n.contains ? n.contains(i) : e.compareDocumentPosition && 16 & e.compareDocumentPosition(i)))
            }: function(e, t) {
                if (t) for (; t = t.parentNode;) if (t === e) return ! 0;
                return ! 1
            },
            U = t ?
            function(e, t) {
                if (e === t) return j = !0,
                0;
                var i = !e.compareDocumentPosition - !t.compareDocumentPosition;
                return i ? i: (i = (e.ownerDocument || e) === (t.ownerDocument || t) ? e.compareDocumentPosition(t) : 1, 1 & i || !_.sortDetached && t.compareDocumentPosition(e) === i ? e === n || e.ownerDocument === B && O(B, e) ? -1 : t === n || t.ownerDocument === B && O(B, t) ? 1 : N ? tt.call(N, e) - tt.call(N, t) : 0 : 4 & i ? -1 : 1)
            }: function(e, t) {
                if (e === t) return j = !0,
                0;
                var i, r = 0,
                o = e.parentNode,
                a = t.parentNode,
                u = [e],
                l = [t];
                if (!o || !a) return e === n ? -1 : t === n ? 1 : o ? -1 : a ? 1 : N ? tt.call(N, e) - tt.call(N, t) : 0;
                if (o === a) return s(e, t);
                for (i = e; i = i.parentNode;) u.unshift(i);
                for (i = t; i = i.parentNode;) l.unshift(i);
                for (; u[r] === l[r];) r++;
                return r ? s(u[r], l[r]) : u[r] === B ? -1 : l[r] === B ? 1 : 0
            },
            n) : D
        },
        t.matches = function(e, n) {
            return t(e, null, null, n)
        },
        t.matchesSelector = function(e, n) {
            if ((e.ownerDocument || e) !== D && A(e), n = n.replace(dt, "='$1']"), !(!_.matchesSelector || !R || q && q.test(n) || L && L.test(n))) try {
                var i = H.call(e, n);
                if (i || _.disconnectedMatch || e.document && 11 !== e.document.nodeType) return i
            } catch(r) {}
            return t(n, D, null, [e]).length > 0
        },
        t.contains = function(e, t) {
            return (e.ownerDocument || e) !== D && A(e),
            O(e, t)
        },
        t.attr = function(e, t) { (e.ownerDocument || e) !== D && A(e);
            var n = E.attrHandle[t.toLowerCase()],
            i = n && Q.call(E.attrHandle, t.toLowerCase()) ? n(e, t, !R) : void 0;
            return void 0 !== i ? i: _.attributes || !R ? e.getAttribute(t) : (i = e.getAttributeNode(t)) && i.specified ? i.value: null
        },
        t.error = function(e) {
            throw new Error("Syntax error, unrecognized expression: " + e)
        },
        t.uniqueSort = function(e) {
            var t, n = [],
            i = 0,
            r = 0;
            if (j = !_.detectDuplicates, N = !_.sortStable && e.slice(0), e.sort(U), j) {
                for (; t = e[r++];) t === e[r] && (i = n.push(r));
                for (; i--;) e.splice(n[i], 1)
            }
            return N = null,
            e
        },
        F = t.getText = function(e) {
            var t, n = "",
            i = 0,
            r = e.nodeType;
            if (r) {
                if (1 === r || 9 === r || 11 === r) {
                    if ("string" == typeof e.textContent) return e.textContent;
                    for (e = e.firstChild; e; e = e.nextSibling) n += F(e)
                } else if (3 === r || 4 === r) return e.nodeValue
            } else for (; t = e[i++];) n += F(t);
            return n
        },
        E = t.selectors = {
            cacheLength: 50,
            createPseudo: i,
            match: pt,
            attrHandle: {},
            find: {},
            relative: {
                ">": {
                    dir: "parentNode",
                    first: !0
                },
                " ": {
                    dir: "parentNode"
                },
                "+": {
                    dir: "previousSibling",
                    first: !0
                },
                "~": {
                    dir: "previousSibling"
                }
            },
            preFilter: {
                ATTR: function(e) {
                    return e[1] = e[1].replace(wt, Ct),
                    e[3] = (e[4] || e[5] || "").replace(wt, Ct),
                    "~=" === e[2] && (e[3] = " " + e[3] + " "),
                    e.slice(0, 4)
                },
                CHILD: function(e) {
                    return e[1] = e[1].toLowerCase(),
                    "nth" === e[1].slice(0, 3) ? (e[3] || t.error(e[0]), e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ("even" === e[3] || "odd" === e[3])), e[5] = +(e[7] + e[8] || "odd" === e[3])) : e[3] && t.error(e[0]),
                    e
                },
                PSEUDO: function(e) {
                    var t, n = !e[5] && e[2];
                    return pt.CHILD.test(e[0]) ? null: (e[3] && void 0 !== e[4] ? e[2] = e[4] : n && ht.test(n) && (t = h(n, !0)) && (t = n.indexOf(")", n.length - t) - n.length) && (e[0] = e[0].slice(0, t), e[2] = n.slice(0, t)), e.slice(0, 3))
                }
            },
            filter: {
                TAG: function(e) {
                    var t = e.replace(wt, Ct).toLowerCase();
                    return "*" === e ?
                    function() {
                        return ! 0
                    }: function(e) {
                        return e.nodeName && e.nodeName.toLowerCase() === t
                    }
                },
                CLASS: function(e) {
                    var t = $[e + " "];
                    return t || (t = new RegExp("(^|" + it + ")" + e + "(" + it + "|$)")) && $(e,
                    function(e) {
                        return t.test("string" == typeof e.className && e.className || typeof e.getAttribute !== X && e.getAttribute("class") || "")
                    })
                },
                ATTR: function(e, n, i) {
                    return function(r) {
                        var o = t.attr(r, e);
                        return null == o ? "!=" === n: n ? (o += "", "=" === n ? o === i: "!=" === n ? o !== i: "^=" === n ? i && 0 === o.indexOf(i) : "*=" === n ? i && o.indexOf(i) > -1 : "$=" === n ? i && o.slice( - i.length) === i: "~=" === n ? (" " + o + " ").indexOf(i) > -1 : "|=" === n ? o === i || o.slice(0, i.length + 1) === i + "-": !1) : !0
                    }
                },
                CHILD: function(e, t, n, i, r) {
                    var o = "nth" !== e.slice(0, 3),
                    s = "last" !== e.slice( - 4),
                    a = "of-type" === t;
                    return 1 === i && 0 === r ?
                    function(e) {
                        return !! e.parentNode
                    }: function(t, n, u) {
                        var l, c, d, h, f, p, g = o !== s ? "nextSibling": "previousSibling",
                        m = t.parentNode,
                        v = a && t.nodeName.toLowerCase(),
                        y = !u && !a;
                        if (m) {
                            if (o) {
                                for (; g;) {
                                    for (d = t; d = d[g];) if (a ? d.nodeName.toLowerCase() === v: 1 === d.nodeType) return ! 1;
                                    p = g = "only" === e && !p && "nextSibling"
                                }
                                return ! 0
                            }
                            if (p = [s ? m.firstChild: m.lastChild], s && y) {
                                for (c = m[I] || (m[I] = {}), l = c[e] || [], f = l[0] === z && l[1], h = l[0] === z && l[2], d = f && m.childNodes[f]; d = ++f && d && d[g] || (h = f = 0) || p.pop();) if (1 === d.nodeType && ++h && d === t) {
                                    c[e] = [z, f, h];
                                    break
                                }
                            } else if (y && (l = (t[I] || (t[I] = {}))[e]) && l[0] === z) h = l[1];
                            else for (; (d = ++f && d && d[g] || (h = f = 0) || p.pop()) && ((a ? d.nodeName.toLowerCase() !== v: 1 !== d.nodeType) || !++h || (y && ((d[I] || (d[I] = {}))[e] = [z, h]), d !== t)););
                            return h -= r,
                            h === i || h % i === 0 && h / i >= 0
                        }
                    }
                },
                PSEUDO: function(e, n) {
                    var r, o = E.pseudos[e] || E.setFilters[e.toLowerCase()] || t.error("unsupported pseudo: " + e);
                    return o[I] ? o(n) : o.length > 1 ? (r = [e, e, "", n], E.setFilters.hasOwnProperty(e.toLowerCase()) ? i(function(e, t) {
                        for (var i, r = o(e, n), s = r.length; s--;) i = tt.call(e, r[s]),
                        e[i] = !(t[i] = r[s])
                    }) : function(e) {
                        return o(e, 0, r)
                    }) : o
                }
            },
            pseudos: {
                not: i(function(e) {
                    var t = [],
                    n = [],
                    r = k(e.replace(ut, "$1"));
                    return r[I] ? i(function(e, t, n, i) {
                        for (var o, s = r(e, null, i, []), a = e.length; a--;)(o = s[a]) && (e[a] = !(t[a] = o))
                    }) : function(e, i, o) {
                        return t[0] = e,
                        r(t, null, o, n),
                        !n.pop()
                    }
                }),
                has: i(function(e) {
                    return function(n) {
                        return t(e, n).length > 0
                    }
                }),
                contains: i(function(e) {
                    return function(t) {
                        return (t.textContent || t.innerText || F(t)).indexOf(e) > -1
                    }
                }),
                lang: i(function(e) {
                    return ft.test(e || "") || t.error("unsupported lang: " + e),
                    e = e.replace(wt, Ct).toLowerCase(),
                    function(t) {
                        var n;
                        do
                        if (n = R ? t.lang: t.getAttribute("xml:lang") || t.getAttribute("lang")) return n = n.toLowerCase(),
                        n === e || 0 === n.indexOf(e + "-");
                        while ((t = t.parentNode) && 1 === t.nodeType);
                        return ! 1
                    }
                }),
                target: function(t) {
                    var n = e.location && e.location.hash;
                    return n && n.slice(1) === t.id
                },
                root: function(e) {
                    return e === M
                },
                focus: function(e) {
                    return e === D.activeElement && (!D.hasFocus || D.hasFocus()) && !!(e.type || e.href || ~e.tabIndex)
                },
                enabled: function(e) {
                    return e.disabled === !1
                },
                disabled: function(e) {
                    return e.disabled === !0
                },
                checked: function(e) {
                    var t = e.nodeName.toLowerCase();
                    return "input" === t && !!e.checked || "option" === t && !!e.selected
                },
                selected: function(e) {
                    return e.parentNode && e.parentNode.selectedIndex,
                    e.selected === !0
                },
                empty: function(e) {
                    for (e = e.firstChild; e; e = e.nextSibling) if (e.nodeType < 6) return ! 1;
                    return ! 0
                },
                parent: function(e) {
                    return ! E.pseudos.empty(e)
                },
                header: function(e) {
                    return mt.test(e.nodeName)
                },
                input: function(e) {
                    return gt.test(e.nodeName)
                },
                button: function(e) {
                    var t = e.nodeName.toLowerCase();
                    return "input" === t && "button" === e.type || "button" === t
                },
                text: function(e) {
                    var t;
                    return "input" === e.nodeName.toLowerCase() && "text" === e.type && (null == (t = e.getAttribute("type")) || "text" === t.toLowerCase())
                },
                first: l(function() {
                    return [0]
                }),
                last: l(function(e, t) {
                    return [t - 1]
                }),
                eq: l(function(e, t, n) {
                    return [0 > n ? n + t: n]
                }),
                even: l(function(e, t) {
                    for (var n = 0; t > n; n += 2) e.push(n);
                    return e
                }),
                odd: l(function(e, t) {
                    for (var n = 1; t > n; n += 2) e.push(n);
                    return e
                }),
                lt: l(function(e, t, n) {
                    for (var i = 0 > n ? n + t: n; --i >= 0;) e.push(i);
                    return e
                }),
                gt: l(function(e, t, n) {
                    for (var i = 0 > n ? n + t: n; ++i < t;) e.push(i);
                    return e
                })
            }
        },
        E.pseudos.nth = E.pseudos.eq;
        for (C in {
            radio: !0,
            checkbox: !0,
            file: !0,
            password: !0,
            image: !0
        }) E.pseudos[C] = a(C);
        for (C in {
            submit: !0,
            reset: !0
        }) E.pseudos[C] = u(C);
        return d.prototype = E.filters = E.pseudos,
        E.setFilters = new d,
        k = t.compile = function(e, t) {
            var n, i = [],
            r = [],
            o = W[e + " "];
            if (!o) {
                for (t || (t = h(e)), n = t.length; n--;) o = y(t[n]),
                o[I] ? i.push(o) : r.push(o);
                o = W(e, b(r, i))
            }
            return o
        },
        _.sortStable = I.split("").sort(U).join("") === I,
        _.detectDuplicates = !!j,
        A(),
        _.sortDetached = r(function(e) {
            return 1 & e.compareDocumentPosition(D.createElement("div"))
        }),
        r(function(e) {
            return e.innerHTML = "<a href='#'></a>",
            "#" === e.firstChild.getAttribute("href")
        }) || o("type|href|height|width",
        function(e, t, n) {
            return n ? void 0 : e.getAttribute(t, "type" === t.toLowerCase() ? 1 : 2)
        }),
        _.attributes && r(function(e) {
            return e.innerHTML = "<input/>",
            e.firstChild.setAttribute("value", ""),
            "" === e.firstChild.getAttribute("value")
        }) || o("value",
        function(e, t, n) {
            return n || "input" !== e.nodeName.toLowerCase() ? void 0 : e.defaultValue
        }),
        r(function(e) {
            return null == e.getAttribute("disabled")
        }) || o(nt,
        function(e, t, n) {
            var i;
            return n ? void 0 : e[t] === !0 ? t.toLowerCase() : (i = e.getAttributeNode(t)) && i.specified ? i.value: null
        }),
        t
    } (e);
    ot.find = ct,
    ot.expr = ct.selectors,
    ot.expr[":"] = ot.expr.pseudos,
    ot.unique = ct.uniqueSort,
    ot.text = ct.getText,
    ot.isXMLDoc = ct.isXML,
    ot.contains = ct.contains;
    var dt = ot.expr.match.needsContext,
    ht = /^<(\w+)\s*\/?>(?:<\/\1>|)$/,
    ft = /^.[^:#\[\.,]*$/;
    ot.filter = function(e, t, n) {
        var i = t[0];
        return n && (e = ":not(" + e + ")"),
        1 === t.length && 1 === i.nodeType ? ot.find.matchesSelector(i, e) ? [i] : [] : ot.find.matches(e, ot.grep(t,
        function(e) {
            return 1 === e.nodeType
        }))
    },
    ot.fn.extend({
        find: function(e) {
            var t, n = [],
            i = this,
            r = i.length;
            if ("string" != typeof e) return this.pushStack(ot(e).filter(function() {
                for (t = 0; r > t; t++) if (ot.contains(i[t], this)) return ! 0
            }));
            for (t = 0; r > t; t++) ot.find(e, i[t], n);
            return n = this.pushStack(r > 1 ? ot.unique(n) : n),
            n.selector = this.selector ? this.selector + " " + e: e,
            n
        },
        filter: function(e) {
            return this.pushStack(i(this, e || [], !1))
        },
        not: function(e) {
            return this.pushStack(i(this, e || [], !0))
        },
        is: function(e) {
            return !! i(this, "string" == typeof e && dt.test(e) ? ot(e) : e || [], !1).length
        }
    });
    var pt, gt = e.document,
    mt = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,
    vt = ot.fn.init = function(e, t) {
        var n, i;
        if (!e) return this;
        if ("string" == typeof e) {
            if (n = "<" === e.charAt(0) && ">" === e.charAt(e.length - 1) && e.length >= 3 ? [null, e, null] : mt.exec(e), !n || !n[1] && t) return ! t || t.jquery ? (t || pt).find(e) : this.constructor(t).find(e);
            if (n[1]) {
                if (t = t instanceof ot ? t[0] : t, ot.merge(this, ot.parseHTML(n[1], t && t.nodeType ? t.ownerDocument || t: gt, !0)), ht.test(n[1]) && ot.isPlainObject(t)) for (n in t) ot.isFunction(this[n]) ? this[n](t[n]) : this.attr(n, t[n]);
                return this
            }
            if (i = gt.getElementById(n[2]), i && i.parentNode) {
                if (i.id !== n[2]) return pt.find(e);
                this.length = 1,
                this[0] = i
            }
            return this.context = gt,
            this.selector = e,
            this
        }
        return e.nodeType ? (this.context = this[0] = e, this.length = 1, this) : ot.isFunction(e) ? "undefined" != typeof pt.ready ? pt.ready(e) : e(ot) : (void 0 !== e.selector && (this.selector = e.selector, this.context = e.context), ot.makeArray(e, this))
    };
    vt.prototype = ot.fn,
    pt = ot(gt);
    var yt = /^(?:parents|prev(?:Until|All))/,
    bt = {
        children: !0,
        contents: !0,
        next: !0,
        prev: !0
    };
    ot.extend({
        dir: function(e, t, n) {
            for (var i = [], r = e[t]; r && 9 !== r.nodeType && (void 0 === n || 1 !== r.nodeType || !ot(r).is(n));) 1 === r.nodeType && i.push(r),
            r = r[t];
            return i
        },
        sibling: function(e, t) {
            for (var n = []; e; e = e.nextSibling) 1 === e.nodeType && e !== t && n.push(e);
            return n
        }
    }),
    ot.fn.extend({
        has: function(e) {
            var t, n = ot(e, this),
            i = n.length;
            return this.filter(function() {
                for (t = 0; i > t; t++) if (ot.contains(this, n[t])) return ! 0
            })
        },
        closest: function(e, t) {
            for (var n, i = 0,
            r = this.length,
            o = [], s = dt.test(e) || "string" != typeof e ? ot(e, t || this.context) : 0; r > i; i++) for (n = this[i]; n && n !== t; n = n.parentNode) if (n.nodeType < 11 && (s ? s.index(n) > -1 : 1 === n.nodeType && ot.find.matchesSelector(n, e))) {
                o.push(n);
                break
            }
            return this.pushStack(o.length > 1 ? ot.unique(o) : o)
        },
        index: function(e) {
            return e ? "string" == typeof e ? ot.inArray(this[0], ot(e)) : ot.inArray(e.jquery ? e[0] : e, this) : this[0] && this[0].parentNode ? this.first().prevAll().length: -1
        },
        add: function(e, t) {
            return this.pushStack(ot.unique(ot.merge(this.get(), ot(e, t))))
        },
        addBack: function(e) {
            return this.add(null == e ? this.prevObject: this.prevObject.filter(e))
        }
    }),
    ot.each({
        parent: function(e) {
            var t = e.parentNode;
            return t && 11 !== t.nodeType ? t: null
        },
        parents: function(e) {
            return ot.dir(e, "parentNode")
        },
        parentsUntil: function(e, t, n) {
            return ot.dir(e, "parentNode", n)
        },
        next: function(e) {
            return r(e, "nextSibling")
        },
        prev: function(e) {
            return r(e, "previousSibling")
        },
        nextAll: function(e) {
            return ot.dir(e, "nextSibling")
        },
        prevAll: function(e) {
            return ot.dir(e, "previousSibling")
        },
        nextUntil: function(e, t, n) {
            return ot.dir(e, "nextSibling", n)
        },
        prevUntil: function(e, t, n) {
            return ot.dir(e, "previousSibling", n)
        },
        siblings: function(e) {
            return ot.sibling((e.parentNode || {}).firstChild, e)
        },
        children: function(e) {
            return ot.sibling(e.firstChild)
        },
        contents: function(e) {
            return ot.nodeName(e, "iframe") ? e.contentDocument || e.contentWindow.document: ot.merge([], e.childNodes)
        }
    },
    function(e, t) {
        ot.fn[e] = function(n, i) {
            var r = ot.map(this, t, n);
            return "Until" !== e.slice( - 5) && (i = n),
            i && "string" == typeof i && (r = ot.filter(i, r)),
            this.length > 1 && (bt[e] || (r = ot.unique(r)), yt.test(e) && (r = r.reverse())),
            this.pushStack(r)
        }
    });
    var xt = /\S+/g,
    wt = {};
    ot.Callbacks = function(e) {
        e = "string" == typeof e ? wt[e] || o(e) : ot.extend({},
        e);
        var t, n, i, r, s, a, u = [],
        l = !e.once && [],
        c = function(o) {
            for (n = e.memory && o, i = !0, s = a || 0, a = 0, r = u.length, t = !0; u && r > s; s++) if (u[s].apply(o[0], o[1]) === !1 && e.stopOnFalse) {
                n = !1;
                break
            }
            t = !1,
            u && (l ? l.length && c(l.shift()) : n ? u = [] : d.disable())
        },
        d = {
            add: function() {
                if (u) {
                    var i = u.length; !
                    function o(t) {
                        ot.each(t,
                        function(t, n) {
                            var i = ot.type(n);
                            "function" === i ? e.unique && d.has(n) || u.push(n) : n && n.length && "string" !== i && o(n)
                        })
                    } (arguments),
                    t ? r = u.length: n && (a = i, c(n))
                }
                return this
            },
            remove: function() {
                return u && ot.each(arguments,
                function(e, n) {
                    for (var i; (i = ot.inArray(n, u, i)) > -1;) u.splice(i, 1),
                    t && (r >= i && r--, s >= i && s--)
                }),
                this
            },
            has: function(e) {
                return e ? ot.inArray(e, u) > -1 : !(!u || !u.length)
            },
            empty: function() {
                return u = [],
                r = 0,
                this
            },
            disable: function() {
                return u = l = n = void 0,
                this
            },
            disabled: function() {
                return ! u
            },
            lock: function() {
                return l = void 0,
                n || d.disable(),
                this
            },
            locked: function() {
                return ! l
            },
            fireWith: function(e, n) {
                return ! u || i && !l || (n = n || [], n = [e, n.slice ? n.slice() : n], t ? l.push(n) : c(n)),
                this
            },
            fire: function() {
                return d.fireWith(this, arguments),
                this
            },
            fired: function() {
                return !! i
            }
        };
        return d
    },
    ot.extend({
        Deferred: function(e) {
            var t = [["resolve", "done", ot.Callbacks("once memory"), "resolved"], ["reject", "fail", ot.Callbacks("once memory"), "rejected"], ["notify", "progress", ot.Callbacks("memory")]],
            n = "pending",
            i = {
                state: function() {
                    return n
                },
                always: function() {
                    return r.done(arguments).fail(arguments),
                    this
                },
                then: function() {
                    var e = arguments;
                    return ot.Deferred(function(n) {
                        ot.each(t,
                        function(t, o) {
                            var s = ot.isFunction(e[t]) && e[t];
                            r[o[1]](function() {
                                var e = s && s.apply(this, arguments);
                                e && ot.isFunction(e.promise) ? e.promise().done(n.resolve).fail(n.reject).progress(n.notify) : n[o[0] + "With"](this === i ? n.promise() : this, s ? [e] : arguments)
                            })
                        }),
                        e = null
                    }).promise()
                },
                promise: function(e) {
                    return null != e ? ot.extend(e, i) : i
                }
            },
            r = {};
            return i.pipe = i.then,
            ot.each(t,
            function(e, o) {
                var s = o[2],
                a = o[3];
                i[o[1]] = s.add,
                a && s.add(function() {
                    n = a
                },
                t[1 ^ e][2].disable, t[2][2].lock),
                r[o[0]] = function() {
                    return r[o[0] + "With"](this === r ? i: this, arguments),
                    this
                },
                r[o[0] + "With"] = s.fireWith
            }),
            i.promise(r),
            e && e.call(r, r),
            r
        },
        when: function(e) {
            var t, n, i, r = 0,
            o = Q.call(arguments),
            s = o.length,
            a = 1 !== s || e && ot.isFunction(e.promise) ? s: 0,
            u = 1 === a ? e: ot.Deferred(),
            l = function(e, n, i) {
                return function(r) {
                    n[e] = this,
                    i[e] = arguments.length > 1 ? Q.call(arguments) : r,
                    i === t ? u.notifyWith(n, i) : --a || u.resolveWith(n, i)
                }
            };
            if (s > 1) for (t = new Array(s), n = new Array(s), i = new Array(s); s > r; r++) o[r] && ot.isFunction(o[r].promise) ? o[r].promise().done(l(r, i, o)).fail(u.reject).progress(l(r, n, t)) : --a;
            return a || u.resolveWith(i, o),
            u.promise()
        }
    });
    var Ct;
    ot.fn.ready = function(e) {
        return ot.ready.promise().done(e),
        this
    },
    ot.extend({
        isReady: !1,
        readyWait: 1,
        holdReady: function(e) {
            e ? ot.readyWait++:ot.ready(!0)
        },
        ready: function(e) {
            if (e === !0 ? !--ot.readyWait: !ot.isReady) {
                if (!gt.body) return setTimeout(ot.ready);
                ot.isReady = !0,
                e !== !0 && --ot.readyWait > 0 || (Ct.resolveWith(gt, [ot]), ot.fn.trigger && ot(gt).trigger("ready").off("ready"))
            }
        }
    }),
    ot.ready.promise = function(t) {
        if (!Ct) if (Ct = ot.Deferred(), "complete" === gt.readyState) setTimeout(ot.ready);
        else if (gt.addEventListener) gt.addEventListener("DOMContentLoaded", a, !1),
        e.addEventListener("load", a, !1);
        else {
            gt.attachEvent("onreadystatechange", a),
            e.attachEvent("onload", a);
            var n = !1;
            try {
                n = null == e.frameElement && gt.documentElement
            } catch(i) {}
            n && n.doScroll && !
            function r() {
                if (!ot.isReady) {
                    try {
                        n.doScroll("left")
                    } catch(e) {
                        return setTimeout(r, 50)
                    }
                    s(),
                    ot.ready()
                }
            } ()
        }
        return Ct.promise(t)
    };
    var _t, Et = "undefined";
    for (_t in ot(it)) break;
    it.ownLast = "0" !== _t,
    it.inlineBlockNeedsLayout = !1,
    ot(function() {
        var e, t, n = gt.getElementsByTagName("body")[0];
        n && (e = gt.createElement("div"), e.style.cssText = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px;margin-top:1px", t = gt.createElement("div"), n.appendChild(e).appendChild(t), typeof t.style.zoom !== Et && (t.style.cssText = "border:0;margin:0;width:1px;padding:1px;display:inline;zoom:1", (it.inlineBlockNeedsLayout = 3 === t.offsetWidth) && (n.style.zoom = 1)), n.removeChild(e), e = t = null)
    }),
    function() {
        var e = gt.createElement("div");
        if (null == it.deleteExpando) {
            it.deleteExpando = !0;
            try {
                delete e.test
            } catch(t) {
                it.deleteExpando = !1
            }
        }
        e = null
    } (),
    ot.acceptData = function(e) {
        var t = ot.noData[(e.nodeName + " ").toLowerCase()],
        n = +e.nodeType || 1;
        return 1 !== n && 9 !== n ? !1 : !t || t !== !0 && e.getAttribute("classid") === t
    };
    var Ft = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,
    Tt = /([A-Z])/g;
    ot.extend({
        cache: {},
        noData: {
            "applet ": !0,
            "embed ": !0,
            "object ": "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
        },
        hasData: function(e) {
            return e = e.nodeType ? ot.cache[e[ot.expando]] : e[ot.expando],
            !!e && !l(e)
        },
        data: function(e, t, n) {
            return c(e, t, n)
        },
        removeData: function(e, t) {
            return d(e, t)
        },
        _data: function(e, t, n) {
            return c(e, t, n, !0)
        },
        _removeData: function(e, t) {
            return d(e, t, !0)
        }
    }),
    ot.fn.extend({
        data: function(e, t) {
            var n, i, r, o = this[0],
            s = o && o.attributes;
            if (void 0 === e) {
                if (this.length && (r = ot.data(o), 1 === o.nodeType && !ot._data(o, "parsedAttrs"))) {
                    for (n = s.length; n--;) i = s[n].name,
                    0 === i.indexOf("data-") && (i = ot.camelCase(i.slice(5)), u(o, i, r[i]));
                    ot._data(o, "parsedAttrs", !0)
                }
                return r
            }
            return "object" == typeof e ? this.each(function() {
                ot.data(this, e)
            }) : arguments.length > 1 ? this.each(function() {
                ot.data(this, e, t)
            }) : o ? u(o, e, ot.data(o, e)) : void 0
        },
        removeData: function(e) {
            return this.each(function() {
                ot.removeData(this, e)
            })
        }
    }),
    ot.extend({
        queue: function(e, t, n) {
            var i;
            return e ? (t = (t || "fx") + "queue", i = ot._data(e, t), n && (!i || ot.isArray(n) ? i = ot._data(e, t, ot.makeArray(n)) : i.push(n)), i || []) : void 0
        },
        dequeue: function(e, t) {
            t = t || "fx";
            var n = ot.queue(e, t),
            i = n.length,
            r = n.shift(),
            o = ot._queueHooks(e, t),
            s = function() {
                ot.dequeue(e, t)
            };
            "inprogress" === r && (r = n.shift(), i--),
            r && ("fx" === t && n.unshift("inprogress"), delete o.stop, r.call(e, s, o)),
            !i && o && o.empty.fire()
        },
        _queueHooks: function(e, t) {
            var n = t + "queueHooks";
            return ot._data(e, n) || ot._data(e, n, {
                empty: ot.Callbacks("once memory").add(function() {
                    ot._removeData(e, t + "queue"),
                    ot._removeData(e, n)
                })
            })
        }
    }),
    ot.fn.extend({
        queue: function(e, t) {
            var n = 2;
            return "string" != typeof e && (t = e, e = "fx", n--),
            arguments.length < n ? ot.queue(this[0], e) : void 0 === t ? this: this.each(function() {
                var n = ot.queue(this, e, t);
                ot._queueHooks(this, e),
                "fx" === e && "inprogress" !== n[0] && ot.dequeue(this, e)
            })
        },
        dequeue: function(e) {
            return this.each(function() {
                ot.dequeue(this, e)
            })
        },
        clearQueue: function(e) {
            return this.queue(e || "fx", [])
        },
        promise: function(e, t) {
            var n, i = 1,
            r = ot.Deferred(),
            o = this,
            s = this.length,
            a = function() {--i || r.resolveWith(o, [o])
            };
            for ("string" != typeof e && (t = e, e = void 0), e = e || "fx"; s--;) n = ot._data(o[s], e + "queueHooks"),
            n && n.empty && (i++, n.empty.add(a));
            return a(),
            r.promise(t)
        }
    });
    var kt = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
    St = ["Top", "Right", "Bottom", "Left"],
    Nt = function(e, t) {
        return e = t || e,
        "none" === ot.css(e, "display") || !ot.contains(e.ownerDocument, e)
    },
    jt = ot.access = function(e, t, n, i, r, o, s) {
        var a = 0,
        u = e.length,
        l = null == n;
        if ("object" === ot.type(n)) {
            r = !0;
            for (a in n) ot.access(e, t, a, n[a], !0, o, s)
        } else if (void 0 !== i && (r = !0, ot.isFunction(i) || (s = !0), l && (s ? (t.call(e, i), t = null) : (l = t, t = function(e, t, n) {
            return l.call(ot(e), n)
        })), t)) for (; u > a; a++) t(e[a], n, s ? i: i.call(e[a], a, t(e[a], n)));
        return r ? e: l ? t.call(e) : u ? t(e[0], n) : o
    },
    At = /^(?:checkbox|radio)$/i; !
    function() {
        var e = gt.createDocumentFragment(),
        t = gt.createElement("div"),
        n = gt.createElement("input");
        if (t.setAttribute("className", "t"), t.innerHTML = "  <link/><table></table><a href='/a'>a</a>", it.leadingWhitespace = 3 === t.firstChild.nodeType, it.tbody = !t.getElementsByTagName("tbody").length, it.htmlSerialize = !!t.getElementsByTagName("link").length, it.html5Clone = "<:nav></:nav>" !== gt.createElement("nav").cloneNode(!0).outerHTML, n.type = "checkbox", n.checked = !0, e.appendChild(n), it.appendChecked = n.checked, t.innerHTML = "<textarea>x</textarea>", it.noCloneChecked = !!t.cloneNode(!0).lastChild.defaultValue, e.appendChild(t), t.innerHTML = "<input type='radio' checked='checked' name='t'/>", it.checkClone = t.cloneNode(!0).cloneNode(!0).lastChild.checked, it.noCloneEvent = !0, t.attachEvent && (t.attachEvent("onclick",
        function() {
            it.noCloneEvent = !1
        }), t.cloneNode(!0).click()), null == it.deleteExpando) {
            it.deleteExpando = !0;
            try {
                delete t.test
            } catch(i) {
                it.deleteExpando = !1
            }
        }
        e = t = n = null
    } (),
    function() {
        var t, n, i = gt.createElement("div");
        for (t in {
            submit: !0,
            change: !0,
            focusin: !0
        }) n = "on" + t,
        (it[t + "Bubbles"] = n in e) || (i.setAttribute(n, "t"), it[t + "Bubbles"] = i.attributes[n].expando === !1);
        i = null
    } ();
    var Dt = /^(?:input|select|textarea)$/i,
    Mt = /^key/,
    Rt = /^(?:mouse|contextmenu)|click/,
    Lt = /^(?:focusinfocus|focusoutblur)$/,
    qt = /^([^.]*)(?:\.(.+)|)$/;
    ot.event = {
        global: {},
        add: function(e, t, n, i, r) {
            var o, s, a, u, l, c, d, h, f, p, g, m = ot._data(e);
            if (m) {
                for (n.handler && (u = n, n = u.handler, r = u.selector), n.guid || (n.guid = ot.guid++), (s = m.events) || (s = m.events = {}), (c = m.handle) || (c = m.handle = function(e) {
                    return typeof ot === Et || e && ot.event.triggered === e.type ? void 0 : ot.event.dispatch.apply(c.elem, arguments)
                },
                c.elem = e), t = (t || "").match(xt) || [""], a = t.length; a--;) o = qt.exec(t[a]) || [],
                f = g = o[1],
                p = (o[2] || "").split(".").sort(),
                f && (l = ot.event.special[f] || {},
                f = (r ? l.delegateType: l.bindType) || f, l = ot.event.special[f] || {},
                d = ot.extend({
                    type: f,
                    origType: g,
                    data: i,
                    handler: n,
                    guid: n.guid,
                    selector: r,
                    needsContext: r && ot.expr.match.needsContext.test(r),
                    namespace: p.join(".")
                },
                u), (h = s[f]) || (h = s[f] = [], h.delegateCount = 0, l.setup && l.setup.call(e, i, p, c) !== !1 || (e.addEventListener ? e.addEventListener(f, c, !1) : e.attachEvent && e.attachEvent("on" + f, c))), l.add && (l.add.call(e, d), d.handler.guid || (d.handler.guid = n.guid)), r ? h.splice(h.delegateCount++, 0, d) : h.push(d), ot.event.global[f] = !0);
                e = null
            }
        },
        remove: function(e, t, n, i, r) {
            var o, s, a, u, l, c, d, h, f, p, g, m = ot.hasData(e) && ot._data(e);
            if (m && (c = m.events)) {
                for (t = (t || "").match(xt) || [""], l = t.length; l--;) if (a = qt.exec(t[l]) || [], f = g = a[1], p = (a[2] || "").split(".").sort(), f) {
                    for (d = ot.event.special[f] || {},
                    f = (i ? d.delegateType: d.bindType) || f, h = c[f] || [], a = a[2] && new RegExp("(^|\\.)" + p.join("\\.(?:.*\\.|)") + "(\\.|$)"), u = o = h.length; o--;) s = h[o],
                    !r && g !== s.origType || n && n.guid !== s.guid || a && !a.test(s.namespace) || i && i !== s.selector && ("**" !== i || !s.selector) || (h.splice(o, 1), s.selector && h.delegateCount--, d.remove && d.remove.call(e, s));
                    u && !h.length && (d.teardown && d.teardown.call(e, p, m.handle) !== !1 || ot.removeEvent(e, f, m.handle), delete c[f])
                } else for (f in c) ot.event.remove(e, f + t[l], n, i, !0);
                ot.isEmptyObject(c) && (delete m.handle, ot._removeData(e, "events"))
            }
        },
        trigger: function(t, n, i, r) {
            var o, s, a, u, l, c, d, h = [i || gt],
            f = tt.call(t, "type") ? t.type: t,
            p = tt.call(t, "namespace") ? t.namespace.split(".") : [];
            if (a = c = i = i || gt, 3 !== i.nodeType && 8 !== i.nodeType && !Lt.test(f + ot.event.triggered) && (f.indexOf(".") >= 0 && (p = f.split("."), f = p.shift(), p.sort()), s = f.indexOf(":") < 0 && "on" + f, t = t[ot.expando] ? t: new ot.Event(f, "object" == typeof t && t), t.isTrigger = r ? 2 : 3, t.namespace = p.join("."), t.namespace_re = t.namespace ? new RegExp("(^|\\.)" + p.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, t.result = void 0, t.target || (t.target = i), n = null == n ? [t] : ot.makeArray(n, [t]), l = ot.event.special[f] || {},
            r || !l.trigger || l.trigger.apply(i, n) !== !1)) {
                if (!r && !l.noBubble && !ot.isWindow(i)) {
                    for (u = l.delegateType || f, Lt.test(u + f) || (a = a.parentNode); a; a = a.parentNode) h.push(a),
                    c = a;
                    c === (i.ownerDocument || gt) && h.push(c.defaultView || c.parentWindow || e)
                }
                for (d = 0; (a = h[d++]) && !t.isPropagationStopped();) t.type = d > 1 ? u: l.bindType || f,
                o = (ot._data(a, "events") || {})[t.type] && ot._data(a, "handle"),
                o && o.apply(a, n),
                o = s && a[s],
                o && o.apply && ot.acceptData(a) && (t.result = o.apply(a, n), t.result === !1 && t.preventDefault());
                if (t.type = f, !r && !t.isDefaultPrevented() && (!l._default || l._default.apply(h.pop(), n) === !1) && ot.acceptData(i) && s && i[f] && !ot.isWindow(i)) {
                    c = i[s],
                    c && (i[s] = null),
                    ot.event.triggered = f;
                    try {
                        i[f]()
                    } catch(g) {}
                    ot.event.triggered = void 0,
                    c && (i[s] = c)
                }
                return t.result
            }
        },
        dispatch: function(e) {
            e = ot.event.fix(e);
            var t, n, i, r, o, s = [],
            a = Q.call(arguments),
            u = (ot._data(this, "events") || {})[e.type] || [],
            l = ot.event.special[e.type] || {};
            if (a[0] = e, e.delegateTarget = this, !l.preDispatch || l.preDispatch.call(this, e) !== !1) {
                for (s = ot.event.handlers.call(this, e, u), t = 0; (r = s[t++]) && !e.isPropagationStopped();) for (e.currentTarget = r.elem, o = 0; (i = r.handlers[o++]) && !e.isImmediatePropagationStopped();)(!e.namespace_re || e.namespace_re.test(i.namespace)) && (e.handleObj = i, e.data = i.data, n = ((ot.event.special[i.origType] || {}).handle || i.handler).apply(r.elem, a), void 0 !== n && (e.result = n) === !1 && (e.preventDefault(), e.stopPropagation()));
                return l.postDispatch && l.postDispatch.call(this, e),
                e.result
            }
        },
        handlers: function(e, t) {
            var n, i, r, o, s = [],
            a = t.delegateCount,
            u = e.target;
            if (a && u.nodeType && (!e.button || "click" !== e.type)) for (; u != this; u = u.parentNode || this) if (1 === u.nodeType && (u.disabled !== !0 || "click" !== e.type)) {
                for (r = [], o = 0; a > o; o++) i = t[o],
                n = i.selector + " ",
                void 0 === r[n] && (r[n] = i.needsContext ? ot(n, this).index(u) >= 0 : ot.find(n, this, null, [u]).length),
                r[n] && r.push(i);
                r.length && s.push({
                    elem: u,
                    handlers: r
                })
            }
            return a < t.length && s.push({
                elem: this,
                handlers: t.slice(a)
            }),
            s
        },
        fix: function(e) {
            if (e[ot.expando]) return e;
            var t, n, i, r = e.type,
            o = e,
            s = this.fixHooks[r];
            for (s || (this.fixHooks[r] = s = Rt.test(r) ? this.mouseHooks: Mt.test(r) ? this.keyHooks: {}), i = s.props ? this.props.concat(s.props) : this.props, e = new ot.Event(o), t = i.length; t--;) n = i[t],
            e[n] = o[n];
            return e.target || (e.target = o.srcElement || gt),
            3 === e.target.nodeType && (e.target = e.target.parentNode),
            e.metaKey = !!e.metaKey,
            s.filter ? s.filter(e, o) : e
        },
        props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
        fixHooks: {},
        keyHooks: {
            props: "char charCode key keyCode".split(" "),
            filter: function(e, t) {
                return null == e.which && (e.which = null != t.charCode ? t.charCode: t.keyCode),
                e
            }
        },
        mouseHooks: {
            props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
            filter: function(e, t) {
                var n, i, r, o = t.button,
                s = t.fromElement;
                return null == e.pageX && null != t.clientX && (i = e.target.ownerDocument || gt, r = i.documentElement, n = i.body, e.pageX = t.clientX + (r && r.scrollLeft || n && n.scrollLeft || 0) - (r && r.clientLeft || n && n.clientLeft || 0), e.pageY = t.clientY + (r && r.scrollTop || n && n.scrollTop || 0) - (r && r.clientTop || n && n.clientTop || 0)),
                !e.relatedTarget && s && (e.relatedTarget = s === e.target ? t.toElement: s),
                e.which || void 0 === o || (e.which = 1 & o ? 1 : 2 & o ? 3 : 4 & o ? 2 : 0),
                e
            }
        },
        special: {
            load: {
                noBubble: !0
            },
            focus: {
                trigger: function() {
                    if (this !== p() && this.focus) try {
                        return this.focus(),
                        !1
                    } catch(e) {}
                },
                delegateType: "focusin"
            },
            blur: {
                trigger: function() {
                    return this === p() && this.blur ? (this.blur(), !1) : void 0
                },
                delegateType: "focusout"
            },
            click: {
                trigger: function() {
                    return ot.nodeName(this, "input") && "checkbox" === this.type && this.click ? (this.click(), !1) : void 0
                },
                _default: function(e) {
                    return ot.nodeName(e.target, "a")
                }
            },
            beforeunload: {
                postDispatch: function(e) {
                    void 0 !== e.result && (e.originalEvent.returnValue = e.result)
                }
            }
        },
        simulate: function(e, t, n, i) {
            var r = ot.extend(new ot.Event, n, {
                type: e,
                isSimulated: !0,
                originalEvent: {}
            });
            i ? ot.event.trigger(r, null, t) : ot.event.dispatch.call(t, r),
            r.isDefaultPrevented() && n.preventDefault()
        }
    },
    ot.removeEvent = gt.removeEventListener ?
    function(e, t, n) {
        e.removeEventListener && e.removeEventListener(t, n, !1)
    }: function(e, t, n) {
        var i = "on" + t;
        e.detachEvent && (typeof e[i] === Et && (e[i] = null), e.detachEvent(i, n))
    },
    ot.Event = function(e, t) {
        return this instanceof ot.Event ? (e && e.type ? (this.originalEvent = e, this.type = e.type, this.isDefaultPrevented = e.defaultPrevented || void 0 === e.defaultPrevented && (e.returnValue === !1 || e.getPreventDefault && e.getPreventDefault()) ? h: f) : this.type = e, t && ot.extend(this, t), this.timeStamp = e && e.timeStamp || ot.now(), void(this[ot.expando] = !0)) : new ot.Event(e, t)
    },
    ot.Event.prototype = {
        isDefaultPrevented: f,
        isPropagationStopped: f,
        isImmediatePropagationStopped: f,
        preventDefault: function() {
            var e = this.originalEvent;
            this.isDefaultPrevented = h,
            e && (e.preventDefault ? e.preventDefault() : e.returnValue = !1)
        },
        stopPropagation: function() {
            var e = this.originalEvent;
            this.isPropagationStopped = h,
            e && (e.stopPropagation && e.stopPropagation(), e.cancelBubble = !0)
        },
        stopImmediatePropagation: function() {
            this.isImmediatePropagationStopped = h,
            this.stopPropagation()
        }
    },
    ot.each({
        mouseenter: "mouseover",
        mouseleave: "mouseout"
    },
    function(e, t) {
        ot.event.special[e] = {
            delegateType: t,
            bindType: t,
            handle: function(e) {
                var n, i = this,
                r = e.relatedTarget,
                o = e.handleObj;
                return (!r || r !== i && !ot.contains(i, r)) && (e.type = o.origType, n = o.handler.apply(this, arguments), e.type = t),
                n
            }
        }
    }),
    it.submitBubbles || (ot.event.special.submit = {
        setup: function() {
            return ot.nodeName(this, "form") ? !1 : void ot.event.add(this, "click._submit keypress._submit",
            function(e) {
                var t = e.target,
                n = ot.nodeName(t, "input") || ot.nodeName(t, "button") ? t.form: void 0;
                n && !ot._data(n, "submitBubbles") && (ot.event.add(n, "submit._submit",
                function(e) {
                    e._submit_bubble = !0
                }), ot._data(n, "submitBubbles", !0))
            })
        },
        postDispatch: function(e) {
            e._submit_bubble && (delete e._submit_bubble, this.parentNode && !e.isTrigger && ot.event.simulate("submit", this.parentNode, e, !0))
        },
        teardown: function() {
            return ot.nodeName(this, "form") ? !1 : void ot.event.remove(this, "._submit")
        }
    }),
    it.changeBubbles || (ot.event.special.change = {
        setup: function() {
            return Dt.test(this.nodeName) ? (("checkbox" === this.type || "radio" === this.type) && (ot.event.add(this, "propertychange._change",
            function(e) {
                "checked" === e.originalEvent.propertyName && (this._just_changed = !0)
            }), ot.event.add(this, "click._change",
            function(e) {
                this._just_changed && !e.isTrigger && (this._just_changed = !1),
                ot.event.simulate("change", this, e, !0)
            })), !1) : void ot.event.add(this, "beforeactivate._change",
            function(e) {
                var t = e.target;
                Dt.test(t.nodeName) && !ot._data(t, "changeBubbles") && (ot.event.add(t, "change._change",
                function(e) { ! this.parentNode || e.isSimulated || e.isTrigger || ot.event.simulate("change", this.parentNode, e, !0)
                }), ot._data(t, "changeBubbles", !0))
            })
        },
        handle: function(e) {
            var t = e.target;
            return this !== t || e.isSimulated || e.isTrigger || "radio" !== t.type && "checkbox" !== t.type ? e.handleObj.handler.apply(this, arguments) : void 0
        },
        teardown: function() {
            return ot.event.remove(this, "._change"),
            !Dt.test(this.nodeName)
        }
    }),
    it.focusinBubbles || ot.each({
        focus: "focusin",
        blur: "focusout"
    },
    function(e, t) {
        var n = function(e) {
            ot.event.simulate(t, e.target, ot.event.fix(e), !0)
        };
        ot.event.special[t] = {
            setup: function() {
                var i = this.ownerDocument || this,
                r = ot._data(i, t);
                r || i.addEventListener(e, n, !0),
                ot._data(i, t, (r || 0) + 1)
            },
            teardown: function() {
                var i = this.ownerDocument || this,
                r = ot._data(i, t) - 1;
                r ? ot._data(i, t, r) : (i.removeEventListener(e, n, !0), ot._removeData(i, t))
            }
        }
    }),
    ot.fn.extend({
        on: function(e, t, n, i, r) {
            var o, s;
            if ("object" == typeof e) {
                "string" != typeof t && (n = n || t, t = void 0);
                for (o in e) this.on(o, t, n, e[o], r);
                return this
            }
            if (null == n && null == i ? (i = t, n = t = void 0) : null == i && ("string" == typeof t ? (i = n, n = void 0) : (i = n, n = t, t = void 0)), i === !1) i = f;
            else if (!i) return this;
            return 1 === r && (s = i, i = function(e) {
                return ot().off(e),
                s.apply(this, arguments)
            },
            i.guid = s.guid || (s.guid = ot.guid++)),
            this.each(function() {
                ot.event.add(this, e, i, n, t)
            })
        },
        one: function(e, t, n, i) {
            return this.on(e, t, n, i, 1)
        },
        off: function(e, t, n) {
            var i, r;
            if (e && e.preventDefault && e.handleObj) return i = e.handleObj,
            ot(e.delegateTarget).off(i.namespace ? i.origType + "." + i.namespace: i.origType, i.selector, i.handler),
            this;
            if ("object" == typeof e) {
                for (r in e) this.off(r, t, e[r]);
                return this
            }
            return (t === !1 || "function" == typeof t) && (n = t, t = void 0),
            n === !1 && (n = f),
            this.each(function() {
                ot.event.remove(this, e, n, t)
            })
        },
        trigger: function(e, t) {
            return this.each(function() {
                ot.event.trigger(e, t, this)
            })
        },
        triggerHandler: function(e, t) {
            var n = this[0];
            return n ? ot.event.trigger(e, t, n, !0) : void 0
        }
    });
    var Ht = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",
    Ot = / jQuery\d+="(?:null|\d+)"/g,
    It = new RegExp("<(?:" + Ht + ")[\\s/>]", "i"),
    Bt = /^\s+/,
    zt = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,
    Pt = /<([\w:]+)/,
    $t = /<tbody/i,
    Vt = /<|&#?\w+;/,
    Wt = /<(?:script|style|link)/i,
    Ut = /checked\s*(?:[^=]|=\s*.checked.)/i,
    Xt = /^$|\/(?:java|ecma)script/i,
    Jt = /^true\/(.*)/,
    Qt = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,
    Gt = {
        option: [1, "<select multiple='multiple'>", "</select>"],
        legend: [1, "<fieldset>", "</fieldset>"],
        area: [1, "<map>", "</map>"],
        param: [1, "<object>", "</object>"],
        thead: [1, "<table>", "</table>"],
        tr: [2, "<table><tbody>", "</tbody></table>"],
        col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"],
        td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
        _default: it.htmlSerialize ? [0, "", ""] : [1, "X<div>", "</div>"]
    },
    Yt = g(gt),
    Kt = Yt.appendChild(gt.createElement("div"));
    Gt.optgroup = Gt.option,
    Gt.tbody = Gt.tfoot = Gt.colgroup = Gt.caption = Gt.thead,
    Gt.th = Gt.td,
    ot.extend({
        clone: function(e, t, n) {
            var i, r, o, s, a, u = ot.contains(e.ownerDocument, e);
            if (it.html5Clone || ot.isXMLDoc(e) || !It.test("<" + e.nodeName + ">") ? o = e.cloneNode(!0) : (Kt.innerHTML = e.outerHTML, Kt.removeChild(o = Kt.firstChild)), !(it.noCloneEvent && it.noCloneChecked || 1 !== e.nodeType && 11 !== e.nodeType || ot.isXMLDoc(e))) for (i = m(o), a = m(e), s = 0; null != (r = a[s]); ++s) i[s] && _(r, i[s]);
            if (t) if (n) for (a = a || m(e), i = i || m(o), s = 0; null != (r = a[s]); s++) C(r, i[s]);
            else C(e, o);
            return i = m(o, "script"),
            i.length > 0 && w(i, !u && m(e, "script")),
            i = a = r = null,
            o
        },
        buildFragment: function(e, t, n, i) {
            for (var r, o, s, a, u, l, c, d = e.length,
            h = g(t), f = [], p = 0; d > p; p++) if (o = e[p], o || 0 === o) if ("object" === ot.type(o)) ot.merge(f, o.nodeType ? [o] : o);
            else if (Vt.test(o)) {
                for (a = a || h.appendChild(t.createElement("div")), u = (Pt.exec(o) || ["", ""])[1].toLowerCase(), c = Gt[u] || Gt._default, a.innerHTML = c[1] + o.replace(zt, "<$1></$2>") + c[2], r = c[0]; r--;) a = a.lastChild;
                if (!it.leadingWhitespace && Bt.test(o) && f.push(t.createTextNode(Bt.exec(o)[0])), !it.tbody) for (o = "table" !== u || $t.test(o) ? "<table>" !== c[1] || $t.test(o) ? 0 : a: a.firstChild, r = o && o.childNodes.length; r--;) ot.nodeName(l = o.childNodes[r], "tbody") && !l.childNodes.length && o.removeChild(l);
                for (ot.merge(f, a.childNodes), a.textContent = ""; a.firstChild;) a.removeChild(a.firstChild);
                a = h.lastChild
            } else f.push(t.createTextNode(o));
            for (a && h.removeChild(a), it.appendChecked || ot.grep(m(f, "input"), v), p = 0; o = f[p++];) if ((!i || -1 === ot.inArray(o, i)) && (s = ot.contains(o.ownerDocument, o), a = m(h.appendChild(o), "script"), s && w(a), n)) for (r = 0; o = a[r++];) Xt.test(o.type || "") && n.push(o);
            return a = null,
            h
        },
        cleanData: function(e, t) {
            for (var n, i, r, o, s = 0,
            a = ot.expando,
            u = ot.cache,
            l = it.deleteExpando,
            c = ot.event.special; null != (n = e[s]); s++) if ((t || ot.acceptData(n)) && (r = n[a], o = r && u[r])) {
                if (o.events) for (i in o.events) c[i] ? ot.event.remove(n, i) : ot.removeEvent(n, i, o.handle);
                u[r] && (delete u[r], l ? delete n[a] : typeof n.removeAttribute !== Et ? n.removeAttribute(a) : n[a] = null, J.push(r))
            }
        }
    }),
    ot.fn.extend({
        text: function(e) {
            return jt(this,
            function(e) {
                return void 0 === e ? ot.text(this) : this.empty().append((this[0] && this[0].ownerDocument || gt).createTextNode(e))
            },
            null, e, arguments.length)
        },
        append: function() {
            return this.domManip(arguments,
            function(e) {
                if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                    var t = y(this, e);
                    t.appendChild(e)
                }
            })
        },
        prepend: function() {
            return this.domManip(arguments,
            function(e) {
                if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                    var t = y(this, e);
                    t.insertBefore(e, t.firstChild)
                }
            })
        },
        before: function() {
            return this.domManip(arguments,
            function(e) {
                this.parentNode && this.parentNode.insertBefore(e, this)
            })
        },
        after: function() {
            return this.domManip(arguments,
            function(e) {
                this.parentNode && this.parentNode.insertBefore(e, this.nextSibling)
            })
        },
        remove: function(e, t) {
            for (var n, i = e ? ot.filter(e, this) : this, r = 0; null != (n = i[r]); r++) t || 1 !== n.nodeType || ot.cleanData(m(n)),
            n.parentNode && (t && ot.contains(n.ownerDocument, n) && w(m(n, "script")), n.parentNode.removeChild(n));
            return this
        },
        empty: function() {
            for (var e, t = 0; null != (e = this[t]); t++) {
                for (1 === e.nodeType && ot.cleanData(m(e, !1)); e.firstChild;) e.removeChild(e.firstChild);
                e.options && ot.nodeName(e, "select") && (e.options.length = 0)
            }
            return this
        },
        clone: function(e, t) {
            return e = null == e ? !1 : e,
            t = null == t ? e: t,
            this.map(function() {
                return ot.clone(this, e, t)
            })
        },
        html: function(e) {
            return jt(this,
            function(e) {
                var t = this[0] || {},
                n = 0,
                i = this.length;
                if (void 0 === e) return 1 === t.nodeType ? t.innerHTML.replace(Ot, "") : void 0;
                if (! ("string" != typeof e || Wt.test(e) || !it.htmlSerialize && It.test(e) || !it.leadingWhitespace && Bt.test(e) || Gt[(Pt.exec(e) || ["", ""])[1].toLowerCase()])) {
                    e = e.replace(zt, "<$1></$2>");
                    try {
                        for (; i > n; n++) t = this[n] || {},
                        1 === t.nodeType && (ot.cleanData(m(t, !1)), t.innerHTML = e);
                        t = 0
                    } catch(r) {}
                }
                t && this.empty().append(e)
            },
            null, e, arguments.length)
        },
        replaceWith: function() {
            var e = arguments[0];
            return this.domManip(arguments,
            function(t) {
                e = this.parentNode,
                ot.cleanData(m(this)),
                e && e.replaceChild(t, this)
            }),
            e && (e.length || e.nodeType) ? this: this.remove()
        },
        detach: function(e) {
            return this.remove(e, !0)
        },
        domManip: function(e, t) {
            e = G.apply([], e);
            var n, i, r, o, s, a, u = 0,
            l = this.length,
            c = this,
            d = l - 1,
            h = e[0],
            f = ot.isFunction(h);
            if (f || l > 1 && "string" == typeof h && !it.checkClone && Ut.test(h)) return this.each(function(n) {
                var i = c.eq(n);
                f && (e[0] = h.call(this, n, i.html())),
                i.domManip(e, t)
            });
            if (l && (a = ot.buildFragment(e, this[0].ownerDocument, !1, this), n = a.firstChild, 1 === a.childNodes.length && (a = n), n)) {
                for (o = ot.map(m(a, "script"), b), r = o.length; l > u; u++) i = a,
                u !== d && (i = ot.clone(i, !0, !0), r && ot.merge(o, m(i, "script"))),
                t.call(this[u], i, u);
                if (r) for (s = o[o.length - 1].ownerDocument, ot.map(o, x), u = 0; r > u; u++) i = o[u],
                Xt.test(i.type || "") && !ot._data(i, "globalEval") && ot.contains(s, i) && (i.src ? ot._evalUrl && ot._evalUrl(i.src) : ot.globalEval((i.text || i.textContent || i.innerHTML || "").replace(Qt, "")));
                a = n = null
            }
            return this
        }
    }),
    ot.each({
        appendTo: "append",
        prependTo: "prepend",
        insertBefore: "before",
        insertAfter: "after",
        replaceAll: "replaceWith"
    },
    function(e, t) {
        ot.fn[e] = function(e) {
            for (var n, i = 0,
            r = [], o = ot(e), s = o.length - 1; s >= i; i++) n = i === s ? this: this.clone(!0),
            ot(o[i])[t](n),
            Y.apply(r, n.get());
            return this.pushStack(r)
        }
    });
    var Zt, en = {}; !
    function() {
        var e, t, n = gt.createElement("div"),
        i = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;padding:0;margin:0;border:0";
        n.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",
        e = n.getElementsByTagName("a")[0],
        e.style.cssText = "float:left;opacity:.5",
        it.opacity = /^0.5/.test(e.style.opacity),
        it.cssFloat = !!e.style.cssFloat,
        n.style.backgroundClip = "content-box",
        n.cloneNode(!0).style.backgroundClip = "",
        it.clearCloneStyle = "content-box" === n.style.backgroundClip,
        e = n = null,
        it.shrinkWrapBlocks = function() {
            var e, n, r, o;
            if (null == t) {
                if (e = gt.getElementsByTagName("body")[0], !e) return;
                o = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px",
                n = gt.createElement("div"),
                r = gt.createElement("div"),
                e.appendChild(n).appendChild(r),
                t = !1,
                typeof r.style.zoom !== Et && (r.style.cssText = i + ";width:1px;padding:1px;zoom:1", r.innerHTML = "<div></div>", r.firstChild.style.width = "5px", t = 3 !== r.offsetWidth),
                e.removeChild(n),
                e = n = r = null
            }
            return t
        }
    } ();
    var tn, nn, rn = /^margin/,
    on = new RegExp("^(" + kt + ")(?!px)[a-z%]+$", "i"),
    sn = /^(top|right|bottom|left)$/;
    e.getComputedStyle ? (tn = function(e) {
        return e.ownerDocument.defaultView.getComputedStyle(e, null)
    },
    nn = function(e, t, n) {
        var i, r, o, s, a = e.style;
        return n = n || tn(e),
        s = n ? n.getPropertyValue(t) || n[t] : void 0,
        n && ("" !== s || ot.contains(e.ownerDocument, e) || (s = ot.style(e, t)), on.test(s) && rn.test(t) && (i = a.width, r = a.minWidth, o = a.maxWidth, a.minWidth = a.maxWidth = a.width = s, s = n.width, a.width = i, a.minWidth = r, a.maxWidth = o)),
        void 0 === s ? s: s + ""
    }) : gt.documentElement.currentStyle && (tn = function(e) {
        return e.currentStyle
    },
    nn = function(e, t, n) {
        var i, r, o, s, a = e.style;
        return n = n || tn(e),
        s = n ? n[t] : void 0,
        null == s && a && a[t] && (s = a[t]),
        on.test(s) && !sn.test(t) && (i = a.left, r = e.runtimeStyle, o = r && r.left, o && (r.left = e.currentStyle.left), a.left = "fontSize" === t ? "1em": s, s = a.pixelLeft + "px", a.left = i, o && (r.left = o)),
        void 0 === s ? s: s + "" || "auto"
    }),
    function() {
        function t() {
            var t, n, i = gt.getElementsByTagName("body")[0];
            i && (t = gt.createElement("div"), n = gt.createElement("div"), t.style.cssText = l, i.appendChild(t).appendChild(n), n.style.cssText = "-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;position:absolute;display:block;padding:1px;border:1px;width:4px;margin-top:1%;top:1%", ot.swap(i, null != i.style.zoom ? {
                zoom: 1
            }: {},
            function() {
                r = 4 === n.offsetWidth
            }), o = !0, s = !1, a = !0, e.getComputedStyle && (s = "1%" !== (e.getComputedStyle(n, null) || {}).top, o = "4px" === (e.getComputedStyle(n, null) || {
                width: "4px"
            }).width), i.removeChild(t), n = i = null)
        }
        var n, i, r, o, s, a, u = gt.createElement("div"),
        l = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px",
        c = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;padding:0;margin:0;border:0";
        u.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",
        n = u.getElementsByTagName("a")[0],
        n.style.cssText = "float:left;opacity:.5",
        it.opacity = /^0.5/.test(n.style.opacity),
        it.cssFloat = !!n.style.cssFloat,
        u.style.backgroundClip = "content-box",
        u.cloneNode(!0).style.backgroundClip = "",
        it.clearCloneStyle = "content-box" === u.style.backgroundClip,
        n = u = null,
        ot.extend(it, {
            reliableHiddenOffsets: function() {
                if (null != i) return i;
                var e, t, n, r = gt.createElement("div"),
                o = gt.getElementsByTagName("body")[0];
                if (o) return r.setAttribute("className", "t"),
                r.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",
                e = gt.createElement("div"),
                e.style.cssText = l,
                o.appendChild(e).appendChild(r),
                r.innerHTML = "<table><tr><td></td><td>t</td></tr></table>",
                t = r.getElementsByTagName("td"),
                t[0].style.cssText = "padding:0;margin:0;border:0;display:none",
                n = 0 === t[0].offsetHeight,
                t[0].style.display = "",
                t[1].style.display = "none",
                i = n && 0 === t[0].offsetHeight,
                o.removeChild(e),
                r = o = null,
                i
            },
            boxSizing: function() {
                return null == r && t(),
                r
            },
            boxSizingReliable: function() {
                return null == o && t(),
                o
            },
            pixelPosition: function() {
                return null == s && t(),
                s
            },
            reliableMarginRight: function() {
                var t, n, i, r;
                if (null == a && e.getComputedStyle) {
                    if (t = gt.getElementsByTagName("body")[0], !t) return;
                    n = gt.createElement("div"),
                    i = gt.createElement("div"),
                    n.style.cssText = l,
                    t.appendChild(n).appendChild(i),
                    r = i.appendChild(gt.createElement("div")),
                    r.style.cssText = i.style.cssText = c,
                    r.style.marginRight = r.style.width = "0",
                    i.style.width = "1px",
                    a = !parseFloat((e.getComputedStyle(r, null) || {}).marginRight),
                    t.removeChild(n)
                }
                return a
            }
        })
    } (),
    ot.swap = function(e, t, n, i) {
        var r, o, s = {};
        for (o in t) s[o] = e.style[o],
        e.style[o] = t[o];
        r = n.apply(e, i || []);
        for (o in t) e.style[o] = s[o];
        return r
    };
    var an = /alpha\([^)]*\)/i,
    un = /opacity\s*=\s*([^)]*)/,
    ln = /^(none|table(?!-c[ea]).+)/,
    cn = new RegExp("^(" + kt + ")(.*)$", "i"),
    dn = new RegExp("^([+-])=(" + kt + ")", "i"),
    hn = {
        position: "absolute",
        visibility: "hidden",
        display: "block"
    },
    fn = {
        letterSpacing: 0,
        fontWeight: 400
    },
    pn = ["Webkit", "O", "Moz", "ms"];
    ot.extend({
        cssHooks: {
            opacity: {
                get: function(e, t) {
                    if (t) {
                        var n = nn(e, "opacity");
                        return "" === n ? "1": n
                    }
                }
            }
        },
        cssNumber: {
            columnCount: !0,
            fillOpacity: !0,
            fontWeight: !0,
            lineHeight: !0,
            opacity: !0,
            order: !0,
            orphans: !0,
            widows: !0,
            zIndex: !0,
            zoom: !0
        },
        cssProps: {
            "float": it.cssFloat ? "cssFloat": "styleFloat"
        },
        style: function(e, t, n, i) {
            if (e && 3 !== e.nodeType && 8 !== e.nodeType && e.style) {
                var r, o, s, a = ot.camelCase(t),
                u = e.style;
                if (t = ot.cssProps[a] || (ot.cssProps[a] = k(u, a)), s = ot.cssHooks[t] || ot.cssHooks[a], void 0 === n) return s && "get" in s && void 0 !== (r = s.get(e, !1, i)) ? r: u[t];
                if (o = typeof n, "string" === o && (r = dn.exec(n)) && (n = (r[1] + 1) * r[2] + parseFloat(ot.css(e, t)), o = "number"), null != n && n === n && ("number" !== o || ot.cssNumber[a] || (n += "px"), it.clearCloneStyle || "" !== n || 0 !== t.indexOf("background") || (u[t] = "inherit"), !(s && "set" in s && void 0 === (n = s.set(e, n, i))))) try {
                    u[t] = "",
                    u[t] = n
                } catch(l) {}
            }
        },
        css: function(e, t, n, i) {
            var r, o, s, a = ot.camelCase(t);
            return t = ot.cssProps[a] || (ot.cssProps[a] = k(e.style, a)),
            s = ot.cssHooks[t] || ot.cssHooks[a],
            s && "get" in s && (o = s.get(e, !0, n)),
            void 0 === o && (o = nn(e, t, i)),
            "normal" === o && t in fn && (o = fn[t]),
            "" === n || n ? (r = parseFloat(o), n === !0 || ot.isNumeric(r) ? r || 0 : o) : o
        }
    }),
    ot.each(["height", "width"],
    function(e, t) {
        ot.cssHooks[t] = {
            get: function(e, n, i) {
                return n ? 0 === e.offsetWidth && ln.test(ot.css(e, "display")) ? ot.swap(e, hn,
                function() {
                    return A(e, t, i)
                }) : A(e, t, i) : void 0
            },
            set: function(e, n, i) {
                var r = i && tn(e);
                return N(e, n, i ? j(e, t, i, it.boxSizing() && "border-box" === ot.css(e, "boxSizing", !1, r), r) : 0)
            }
        }
    }),
    it.opacity || (ot.cssHooks.opacity = {
        get: function(e, t) {
            return un.test((t && e.currentStyle ? e.currentStyle.filter: e.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "": t ? "1": ""
        },
        set: function(e, t) {
            var n = e.style,
            i = e.currentStyle,
            r = ot.isNumeric(t) ? "alpha(opacity=" + 100 * t + ")": "",
            o = i && i.filter || n.filter || "";
            n.zoom = 1,
            (t >= 1 || "" === t) && "" === ot.trim(o.replace(an, "")) && n.removeAttribute && (n.removeAttribute("filter"), "" === t || i && !i.filter) || (n.filter = an.test(o) ? o.replace(an, r) : o + " " + r)
        }
    }),
    ot.cssHooks.marginRight = T(it.reliableMarginRight,
    function(e, t) {
        return t ? ot.swap(e, {
            display: "inline-block"
        },
        nn, [e, "marginRight"]) : void 0
    }),
    ot.each({
        margin: "",
        padding: "",
        border: "Width"
    },
    function(e, t) {
        ot.cssHooks[e + t] = {
            expand: function(n) {
                for (var i = 0,
                r = {},
                o = "string" == typeof n ? n.split(" ") : [n]; 4 > i; i++) r[e + St[i] + t] = o[i] || o[i - 2] || o[0];
                return r
            }
        },
        rn.test(e) || (ot.cssHooks[e + t].set = N)
    }),
    ot.fn.extend({
        css: function(e, t) {
            return jt(this,
            function(e, t, n) {
                var i, r, o = {},
                s = 0;
                if (ot.isArray(t)) {
                    for (i = tn(e), r = t.length; r > s; s++) o[t[s]] = ot.css(e, t[s], !1, i);
                    return o
                }
                return void 0 !== n ? ot.style(e, t, n) : ot.css(e, t)
            },
            e, t, arguments.length > 1)
        },
        show: function() {
            return S(this, !0)
        },
        hide: function() {
            return S(this)
        },
        toggle: function(e) {
            return "boolean" == typeof e ? e ? this.show() : this.hide() : this.each(function() {
                Nt(this) ? ot(this).show() : ot(this).hide()
            })
        }
    }),
    ot.Tween = D,
    D.prototype = {
        constructor: D,
        init: function(e, t, n, i, r, o) {
            this.elem = e,
            this.prop = n,
            this.easing = r || "swing",
            this.options = t,
            this.start = this.now = this.cur(),
            this.end = i,
            this.unit = o || (ot.cssNumber[n] ? "": "px")
        },
        cur: function() {
            var e = D.propHooks[this.prop];
            return e && e.get ? e.get(this) : D.propHooks._default.get(this)
        },
        run: function(e) {
            var t, n = D.propHooks[this.prop];
            return this.pos = t = this.options.duration ? ot.easing[this.easing](e, this.options.duration * e, 0, 1, this.options.duration) : e,
            this.now = (this.end - this.start) * t + this.start,
            this.options.step && this.options.step.call(this.elem, this.now, this),
            n && n.set ? n.set(this) : D.propHooks._default.set(this),
            this
        }
    },
    D.prototype.init.prototype = D.prototype,
    D.propHooks = {
        _default: {
            get: function(e) {
                var t;
                return null == e.elem[e.prop] || e.elem.style && null != e.elem.style[e.prop] ? (t = ot.css(e.elem, e.prop, ""), t && "auto" !== t ? t: 0) : e.elem[e.prop]
            },
            set: function(e) {
                ot.fx.step[e.prop] ? ot.fx.step[e.prop](e) : e.elem.style && (null != e.elem.style[ot.cssProps[e.prop]] || ot.cssHooks[e.prop]) ? ot.style(e.elem, e.prop, e.now + e.unit) : e.elem[e.prop] = e.now
            }
        }
    },
    D.propHooks.scrollTop = D.propHooks.scrollLeft = {
        set: function(e) {
            e.elem.nodeType && e.elem.parentNode && (e.elem[e.prop] = e.now)
        }
    },
    ot.easing = {
        linear: function(e) {
            return e
        },
        swing: function(e) {
            return.5 - Math.cos(e * Math.PI) / 2
        }
    },
    ot.fx = D.prototype.init,
    ot.fx.step = {};
    var gn, mn, vn = /^(?:toggle|show|hide)$/,
    yn = new RegExp("^(?:([+-])=|)(" + kt + ")([a-z%]*)$", "i"),
    bn = /queueHooks$/,
    xn = [q],
    wn = {
        "*": [function(e, t) {
            var n = this.createTween(e, t),
            i = n.cur(),
            r = yn.exec(t),
            o = r && r[3] || (ot.cssNumber[e] ? "": "px"),
            s = (ot.cssNumber[e] || "px" !== o && +i) && yn.exec(ot.css(n.elem, e)),
            a = 1,
            u = 20;
            if (s && s[3] !== o) {
                o = o || s[3],
                r = r || [],
                s = +i || 1;
                do a = a || ".5",
                s /= a,
                ot.style(n.elem, e, s + o);
                while (a !== (a = n.cur() / i) && 1 !== a && --u)
            }
            return r && (s = n.start = +s || +i || 0, n.unit = o, n.end = r[1] ? s + (r[1] + 1) * r[2] : +r[2]),
            n
        }]
    };
    ot.Animation = ot.extend(O, {
        tweener: function(e, t) {
            ot.isFunction(e) ? (t = e, e = ["*"]) : e = e.split(" ");
            for (var n, i = 0,
            r = e.length; r > i; i++) n = e[i],
            wn[n] = wn[n] || [],
            wn[n].unshift(t)
        },
        prefilter: function(e, t) {
            t ? xn.unshift(e) : xn.push(e)
        }
    }),
    ot.speed = function(e, t, n) {
        var i = e && "object" == typeof e ? ot.extend({},
        e) : {
            complete: n || !n && t || ot.isFunction(e) && e,
            duration: e,
            easing: n && t || t && !ot.isFunction(t) && t
        };
        return i.duration = ot.fx.off ? 0 : "number" == typeof i.duration ? i.duration: i.duration in ot.fx.speeds ? ot.fx.speeds[i.duration] : ot.fx.speeds._default,
        (null == i.queue || i.queue === !0) && (i.queue = "fx"),
        i.old = i.complete,
        i.complete = function() {
            ot.isFunction(i.old) && i.old.call(this),
            i.queue && ot.dequeue(this, i.queue)
        },
        i
    },
    ot.fn.extend({
        fadeTo: function(e, t, n, i) {
            return this.filter(Nt).css("opacity", 0).show().end().animate({
                opacity: t
            },
            e, n, i)
        },
        animate: function(e, t, n, i) {
            var r = ot.isEmptyObject(e),
            o = ot.speed(t, n, i),
            s = function() {
                var t = O(this, ot.extend({},
                e), o); (r || ot._data(this, "finish")) && t.stop(!0)
            };
            return s.finish = s,
            r || o.queue === !1 ? this.each(s) : this.queue(o.queue, s)
        },
        stop: function(e, t, n) {
            var i = function(e) {
                var t = e.stop;
                delete e.stop,
                t(n)
            };
            return "string" != typeof e && (n = t, t = e, e = void 0),
            t && e !== !1 && this.queue(e || "fx", []),
            this.each(function() {
                var t = !0,
                r = null != e && e + "queueHooks",
                o = ot.timers,
                s = ot._data(this);
                if (r) s[r] && s[r].stop && i(s[r]);
                else for (r in s) s[r] && s[r].stop && bn.test(r) && i(s[r]);
                for (r = o.length; r--;) o[r].elem !== this || null != e && o[r].queue !== e || (o[r].anim.stop(n), t = !1, o.splice(r, 1)); (t || !n) && ot.dequeue(this, e)
            })
        },
        finish: function(e) {
            return e !== !1 && (e = e || "fx"),
            this.each(function() {
                var t, n = ot._data(this),
                i = n[e + "queue"],
                r = n[e + "queueHooks"],
                o = ot.timers,
                s = i ? i.length: 0;
                for (n.finish = !0, ot.queue(this, e, []), r && r.stop && r.stop.call(this, !0), t = o.length; t--;) o[t].elem === this && o[t].queue === e && (o[t].anim.stop(!0), o.splice(t, 1));
                for (t = 0; s > t; t++) i[t] && i[t].finish && i[t].finish.call(this);
                delete n.finish
            })
        }
    }),
    ot.each(["toggle", "show", "hide"],
    function(e, t) {
        var n = ot.fn[t];
        ot.fn[t] = function(e, i, r) {
            return null == e || "boolean" == typeof e ? n.apply(this, arguments) : this.animate(R(t, !0), e, i, r)
        }
    }),
    ot.each({
        slideDown: R("show"),
        slideUp: R("hide"),
        slideToggle: R("toggle"),
        fadeIn: {
            opacity: "show"
        },
        fadeOut: {
            opacity: "hide"
        },
        fadeToggle: {
            opacity: "toggle"
        }
    },
    function(e, t) {
        ot.fn[e] = function(e, n, i) {
            return this.animate(t, e, n, i)
        }
    }),
    ot.timers = [],
    ot.fx.tick = function() {
        var e, t = ot.timers,
        n = 0;
        for (gn = ot.now(); n < t.length; n++) e = t[n],
        e() || t[n] !== e || t.splice(n--, 1);
        t.length || ot.fx.stop(),
        gn = void 0
    },
    ot.fx.timer = function(e) {
        ot.timers.push(e),
        e() ? ot.fx.start() : ot.timers.pop()
    },
    ot.fx.interval = 13,
    ot.fx.start = function() {
        mn || (mn = setInterval(ot.fx.tick, ot.fx.interval))
    },
    ot.fx.stop = function() {
        clearInterval(mn),
        mn = null
    },
    ot.fx.speeds = {
        slow: 600,
        fast: 200,
        _default: 400
    },
    ot.fn.delay = function(e, t) {
        return e = ot.fx ? ot.fx.speeds[e] || e: e,
        t = t || "fx",
        this.queue(t,
        function(t, n) {
            var i = setTimeout(t, e);
            n.stop = function() {
                clearTimeout(i)
            }
        })
    },
    function() {
        var e, t, n, i, r = gt.createElement("div");
        r.setAttribute("className", "t"),
        r.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",
        e = r.getElementsByTagName("a")[0],
        n = gt.createElement("select"),
        i = n.appendChild(gt.createElement("option")),
        t = r.getElementsByTagName("input")[0],
        e.style.cssText = "top:1px",
        it.getSetAttribute = "t" !== r.className,
        it.style = /top/.test(e.getAttribute("style")),
        it.hrefNormalized = "/a" === e.getAttribute("href"),
        it.checkOn = !!t.value,
        it.optSelected = i.selected,
        it.enctype = !!gt.createElement("form").enctype,
        n.disabled = !0,
        it.optDisabled = !i.disabled,
        t = gt.createElement("input"),
        t.setAttribute("value", ""),
        it.input = "" === t.getAttribute("value"),
        t.value = "t",
        t.setAttribute("type", "radio"),
        it.radioValue = "t" === t.value,
        e = t = n = i = r = null
    } ();
    var Cn = /\r/g;
    ot.fn.extend({
        val: function(e) {
            var t, n, i, r = this[0]; {
                if (arguments.length) return i = ot.isFunction(e),
                this.each(function(n) {
                    var r;
                    1 === this.nodeType && (r = i ? e.call(this, n, ot(this).val()) : e, null == r ? r = "": "number" == typeof r ? r += "": ot.isArray(r) && (r = ot.map(r,
                    function(e) {
                        return null == e ? "": e + ""
                    })), t = ot.valHooks[this.type] || ot.valHooks[this.nodeName.toLowerCase()], t && "set" in t && void 0 !== t.set(this, r, "value") || (this.value = r))
                });
                if (r) return t = ot.valHooks[r.type] || ot.valHooks[r.nodeName.toLowerCase()],
                t && "get" in t && void 0 !== (n = t.get(r, "value")) ? n: (n = r.value, "string" == typeof n ? n.replace(Cn, "") : null == n ? "": n)
            }
        }
    }),
    ot.extend({
        valHooks: {
            option: {
                get: function(e) {
                    var t = ot.find.attr(e, "value");
                    return null != t ? t: ot.text(e)
                }
            },
            select: {
                get: function(e) {
                    for (var t, n, i = e.options,
                    r = e.selectedIndex,
                    o = "select-one" === e.type || 0 > r,
                    s = o ? null: [], a = o ? r + 1 : i.length, u = 0 > r ? a: o ? r: 0; a > u; u++) if (n = i[u], !(!n.selected && u !== r || (it.optDisabled ? n.disabled: null !== n.getAttribute("disabled")) || n.parentNode.disabled && ot.nodeName(n.parentNode, "optgroup"))) {
                        if (t = ot(n).val(), o) return t;
                        s.push(t)
                    }
                    return s
                },
                set: function(e, t) {
                    for (var n, i, r = e.options,
                    o = ot.makeArray(t), s = r.length; s--;) if (i = r[s], ot.inArray(ot.valHooks.option.get(i), o) >= 0) try {
                        i.selected = n = !0
                    } catch(a) {
                        i.scrollHeight
                    } else i.selected = !1;
                    return n || (e.selectedIndex = -1),
                    r
                }
            }
        }
    }),
    ot.each(["radio", "checkbox"],
    function() {
        ot.valHooks[this] = {
            set: function(e, t) {
                return ot.isArray(t) ? e.checked = ot.inArray(ot(e).val(), t) >= 0 : void 0
            }
        },
        it.checkOn || (ot.valHooks[this].get = function(e) {
            return null === e.getAttribute("value") ? "on": e.value
        })
    });
    var _n, En, Fn = ot.expr.attrHandle,
    Tn = /^(?:checked|selected)$/i,
    kn = it.getSetAttribute,
    Sn = it.input;
    ot.fn.extend({
        attr: function(e, t) {
            return jt(this, ot.attr, e, t, arguments.length > 1)
        },
        removeAttr: function(e) {
            return this.each(function() {
                ot.removeAttr(this, e)
            })
        }
    }),
    ot.extend({
        attr: function(e, t, n) {
            var i, r, o = e.nodeType;
            if (e && 3 !== o && 8 !== o && 2 !== o) return typeof e.getAttribute === Et ? ot.prop(e, t, n) : (1 === o && ot.isXMLDoc(e) || (t = t.toLowerCase(), i = ot.attrHooks[t] || (ot.expr.match.bool.test(t) ? En: _n)), void 0 === n ? i && "get" in i && null !== (r = i.get(e, t)) ? r: (r = ot.find.attr(e, t), null == r ? void 0 : r) : null !== n ? i && "set" in i && void 0 !== (r = i.set(e, n, t)) ? r: (e.setAttribute(t, n + ""), n) : void ot.removeAttr(e, t))
        },
        removeAttr: function(e, t) {
            var n, i, r = 0,
            o = t && t.match(xt);
            if (o && 1 === e.nodeType) for (; n = o[r++];) i = ot.propFix[n] || n,
            ot.expr.match.bool.test(n) ? Sn && kn || !Tn.test(n) ? e[i] = !1 : e[ot.camelCase("default-" + n)] = e[i] = !1 : ot.attr(e, n, ""),
            e.removeAttribute(kn ? n: i)
        },
        attrHooks: {
            type: {
                set: function(e, t) {
                    if (!it.radioValue && "radio" === t && ot.nodeName(e, "input")) {
                        var n = e.value;
                        return e.setAttribute("type", t),
                        n && (e.value = n),
                        t
                    }
                }
            }
        }
    }),
    En = {
        set: function(e, t, n) {
            return t === !1 ? ot.removeAttr(e, n) : Sn && kn || !Tn.test(n) ? e.setAttribute(!kn && ot.propFix[n] || n, n) : e[ot.camelCase("default-" + n)] = e[n] = !0,
            n
        }
    },
    ot.each(ot.expr.match.bool.source.match(/\w+/g),
    function(e, t) {
        var n = Fn[t] || ot.find.attr;
        Fn[t] = Sn && kn || !Tn.test(t) ?
        function(e, t, i) {
            var r, o;
            return i || (o = Fn[t], Fn[t] = r, r = null != n(e, t, i) ? t.toLowerCase() : null, Fn[t] = o),
            r
        }: function(e, t, n) {
            return n ? void 0 : e[ot.camelCase("default-" + t)] ? t.toLowerCase() : null
        }
    }),
    Sn && kn || (ot.attrHooks.value = {
        set: function(e, t, n) {
            return ot.nodeName(e, "input") ? void(e.defaultValue = t) : _n && _n.set(e, t, n)
        }
    }),
    kn || (_n = {
        set: function(e, t, n) {
            var i = e.getAttributeNode(n);
            return i || e.setAttributeNode(i = e.ownerDocument.createAttribute(n)),
            i.value = t += "",
            "value" === n || t === e.getAttribute(n) ? t: void 0
        }
    },
    Fn.id = Fn.name = Fn.coords = function(e, t, n) {
        var i;
        return n ? void 0 : (i = e.getAttributeNode(t)) && "" !== i.value ? i.value: null
    },
    ot.valHooks.button = {
        get: function(e, t) {
            var n = e.getAttributeNode(t);
            return n && n.specified ? n.value: void 0
        },
        set: _n.set
    },
    ot.attrHooks.contenteditable = {
        set: function(e, t, n) {
            _n.set(e, "" === t ? !1 : t, n)
        }
    },
    ot.each(["width", "height"],
    function(e, t) {
        ot.attrHooks[t] = {
            set: function(e, n) {
                return "" === n ? (e.setAttribute(t, "auto"), n) : void 0
            }
        }
    })),
    it.style || (ot.attrHooks.style = {
        get: function(e) {
            return e.style.cssText || void 0
        },
        set: function(e, t) {
            return e.style.cssText = t + ""
        }
    });
    var Nn = /^(?:input|select|textarea|button|object)$/i,
    jn = /^(?:a|area)$/i;
    ot.fn.extend({
        prop: function(e, t) {
            return jt(this, ot.prop, e, t, arguments.length > 1)
        },
        removeProp: function(e) {
            return e = ot.propFix[e] || e,
            this.each(function() {
                try {
                    this[e] = void 0,
                    delete this[e]
                } catch(t) {}
            })
        }
    }),
    ot.extend({
        propFix: {
            "for": "htmlFor",
            "class": "className"
        },
        prop: function(e, t, n) {
            var i, r, o, s = e.nodeType;
            if (e && 3 !== s && 8 !== s && 2 !== s) return o = 1 !== s || !ot.isXMLDoc(e),
            o && (t = ot.propFix[t] || t, r = ot.propHooks[t]),
            void 0 !== n ? r && "set" in r && void 0 !== (i = r.set(e, n, t)) ? i: e[t] = n: r && "get" in r && null !== (i = r.get(e, t)) ? i: e[t]
        },
        propHooks: {
            tabIndex: {
                get: function(e) {
                    var t = ot.find.attr(e, "tabindex");
                    return t ? parseInt(t, 10) : Nn.test(e.nodeName) || jn.test(e.nodeName) && e.href ? 0 : -1
                }
            }
        }
    }),
    it.hrefNormalized || ot.each(["href", "src"],
    function(e, t) {
        ot.propHooks[t] = {
            get: function(e) {
                return e.getAttribute(t, 4)
            }
        }
    }),
    it.optSelected || (ot.propHooks.selected = {
        get: function(e) {
            var t = e.parentNode;
            return t && (t.selectedIndex, t.parentNode && t.parentNode.selectedIndex),
            null
        }
    }),
    ot.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"],
    function() {
        ot.propFix[this.toLowerCase()] = this
    }),
    it.enctype || (ot.propFix.enctype = "encoding");
    var An = /[\t\r\n\f]/g;
    ot.fn.extend({
        addClass: function(e) {
            var t, n, i, r, o, s, a = 0,
            u = this.length,
            l = "string" == typeof e && e;
            if (ot.isFunction(e)) return this.each(function(t) {
                ot(this).addClass(e.call(this, t, this.className))
            });
            if (l) for (t = (e || "").match(xt) || []; u > a; a++) if (n = this[a], i = 1 === n.nodeType && (n.className ? (" " + n.className + " ").replace(An, " ") : " ")) {
                for (o = 0; r = t[o++];) i.indexOf(" " + r + " ") < 0 && (i += r + " ");
                s = ot.trim(i),
                n.className !== s && (n.className = s)
            }
            return this
        },
        removeClass: function(e) {
            var t, n, i, r, o, s, a = 0,
            u = this.length,
            l = 0 === arguments.length || "string" == typeof e && e;
            if (ot.isFunction(e)) return this.each(function(t) {
                ot(this).removeClass(e.call(this, t, this.className))
            });
            if (l) for (t = (e || "").match(xt) || []; u > a; a++) if (n = this[a], i = 1 === n.nodeType && (n.className ? (" " + n.className + " ").replace(An, " ") : "")) {
                for (o = 0; r = t[o++];) for (; i.indexOf(" " + r + " ") >= 0;) i = i.replace(" " + r + " ", " ");
                s = e ? ot.trim(i) : "",
                n.className !== s && (n.className = s)
            }
            return this
        },
        toggleClass: function(e, t) {
            var n = typeof e;
            return "boolean" == typeof t && "string" === n ? t ? this.addClass(e) : this.removeClass(e) : this.each(ot.isFunction(e) ?
            function(n) {
                ot(this).toggleClass(e.call(this, n, this.className, t), t)
            }: function() {
                if ("string" === n) for (var t, i = 0,
                r = ot(this), o = e.match(xt) || []; t = o[i++];) r.hasClass(t) ? r.removeClass(t) : r.addClass(t);
                else(n === Et || "boolean" === n) && (this.className && ot._data(this, "__className__", this.className), this.className = this.className || e === !1 ? "": ot._data(this, "__className__") || "")
            })
        },
        hasClass: function(e) {
            for (var t = " " + e + " ",
            n = 0,
            i = this.length; i > n; n++) if (1 === this[n].nodeType && (" " + this[n].className + " ").replace(An, " ").indexOf(t) >= 0) return ! 0;
            return ! 1
        }
    }),
    ot.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),
    function(e, t) {
        ot.fn[t] = function(e, n) {
            return arguments.length > 0 ? this.on(t, null, e, n) : this.trigger(t)
        }
    }),
    ot.fn.extend({
        hover: function(e, t) {
            return this.mouseenter(e).mouseleave(t || e)
        },
        bind: function(e, t, n) {
            return this.on(e, null, t, n)
        },
        unbind: function(e, t) {
            return this.off(e, null, t)
        },
        delegate: function(e, t, n, i) {
            return this.on(t, e, n, i)
        },
        undelegate: function(e, t, n) {
            return 1 === arguments.length ? this.off(e, "**") : this.off(t, e || "**", n)
        }
    });
    var Dn = ot.now(),
    Mn = /\?/,
    Rn = /(,)|(\[|{)|(}|])|"(?:[^"\\\r\n]|\\["\\\/bfnrt]|\\u[\da-fA-F]{4})*"\s*:?|true|false|null|-?(?!0\d)\d+(?:\.\d+|)(?:[eE][+-]?\d+|)/g;
    ot.parseJSON = function(t) {
        if (e.JSON && e.JSON.parse) return e.JSON.parse(t + "");
        var n, i = null,
        r = ot.trim(t + "");
        return r && !ot.trim(r.replace(Rn,
        function(e, t, r, o) {
            return n && t && (i = 0),
            0 === i ? e: (n = r || t, i += !o - !r, "")
        })) ? Function("return " + r)() : ot.error("Invalid JSON: " + t)
    },
    ot.parseXML = function(t) {
        var n, i;
        if (!t || "string" != typeof t) return null;
        try {
            e.DOMParser ? (i = new DOMParser, n = i.parseFromString(t, "text/xml")) : (n = new ActiveXObject("Microsoft.XMLDOM"), n.async = "false", n.loadXML(t))
        } catch(r) {
            n = void 0
        }
        return n && n.documentElement && !n.getElementsByTagName("parsererror").length || ot.error("Invalid XML: " + t),
        n
    };
    var Ln, qn, Hn = /#.*$/,
    On = /([?&])_=[^&]*/,
    In = /^(.*?):[ \t]*([^\r\n]*)\r?$/gm,
    Bn = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/,
    zn = /^(?:GET|HEAD)$/,
    Pn = /^\/\//,
    $n = /^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/,
    Vn = {},
    Wn = {},
    Un = "*/".concat("*");
    try {
        qn = location.href
    } catch(Xn) {
        qn = gt.createElement("a"),
        qn.href = "",
        qn = qn.href
    }
    Ln = $n.exec(qn.toLowerCase()) || [],
    ot.extend({
        active: 0,
        lastModified: {},
        etag: {},
        ajaxSettings: {
            url: qn,
            type: "GET",
            isLocal: Bn.test(Ln[1]),
            global: !0,
            processData: !0,
            async: !0,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            accepts: {
                "*": Un,
                text: "text/plain",
                html: "text/html",
                xml: "application/xml, text/xml",
                json: "application/json, text/javascript"
            },
            contents: {
                xml: /xml/,
                html: /html/,
                json: /json/
            },
            responseFields: {
                xml: "responseXML",
                text: "responseText",
                json: "responseJSON"
            },
            converters: {
                "* text": String,
                "text html": !0,
                "text json": ot.parseJSON,
                "text xml": ot.parseXML
            },
            flatOptions: {
                url: !0,
                context: !0
            }
        },
        ajaxSetup: function(e, t) {
            return t ? z(z(e, ot.ajaxSettings), t) : z(ot.ajaxSettings, e)
        },
        ajaxPrefilter: I(Vn),
        ajaxTransport: I(Wn),
        ajax: function(e, t) {
            function n(e, t, n, i) {
                var r, c, v, y, x, C = t;
                2 !== b && (b = 2, a && clearTimeout(a), l = void 0, s = i || "", w.readyState = e > 0 ? 4 : 0, r = e >= 200 && 300 > e || 304 === e, n && (y = P(d, w, n)), y = $(d, y, w, r), r ? (d.ifModified && (x = w.getResponseHeader("Last-Modified"), x && (ot.lastModified[o] = x), x = w.getResponseHeader("etag"), x && (ot.etag[o] = x)), 204 === e || "HEAD" === d.type ? C = "nocontent": 304 === e ? C = "notmodified": (C = y.state, c = y.data, v = y.error, r = !v)) : (v = C, (e || !C) && (C = "error", 0 > e && (e = 0))), w.status = e, w.statusText = (t || C) + "", r ? p.resolveWith(h, [c, C, w]) : p.rejectWith(h, [w, C, v]), w.statusCode(m), m = void 0, u && f.trigger(r ? "ajaxSuccess": "ajaxError", [w, d, r ? c: v]), g.fireWith(h, [w, C]), u && (f.trigger("ajaxComplete", [w, d]), --ot.active || ot.event.trigger("ajaxStop")))
            }
            "object" == typeof e && (t = e, e = void 0),
            t = t || {};
            var i, r, o, s, a, u, l, c, d = ot.ajaxSetup({},
            t),
            h = d.context || d,
            f = d.context && (h.nodeType || h.jquery) ? ot(h) : ot.event,
            p = ot.Deferred(),
            g = ot.Callbacks("once memory"),
            m = d.statusCode || {},
            v = {},
            y = {},
            b = 0,
            x = "canceled",
            w = {
                readyState: 0,
                getResponseHeader: function(e) {
                    var t;
                    if (2 === b) {
                        if (!c) for (c = {}; t = In.exec(s);) c[t[1].toLowerCase()] = t[2];
                        t = c[e.toLowerCase()]
                    }
                    return null == t ? null: t
                },
                getAllResponseHeaders: function() {
                    return 2 === b ? s: null
                },
                setRequestHeader: function(e, t) {
                    var n = e.toLowerCase();
                    return b || (e = y[n] = y[n] || e, v[e] = t),
                    this
                },
                overrideMimeType: function(e) {
                    return b || (d.mimeType = e),
                    this
                },
                statusCode: function(e) {
                    var t;
                    if (e) if (2 > b) for (t in e) m[t] = [m[t], e[t]];
                    else w.always(e[w.status]);
                    return this
                },
                abort: function(e) {
                    var t = e || x;
                    return l && l.abort(t),
                    n(0, t),
                    this
                }
            };
            if (p.promise(w).complete = g.add, w.success = w.done, w.error = w.fail, d.url = ((e || d.url || qn) + "").replace(Hn, "").replace(Pn, Ln[1] + "//"), d.type = t.method || t.type || d.method || d.type, d.dataTypes = ot.trim(d.dataType || "*").toLowerCase().match(xt) || [""], null == d.crossDomain && (i = $n.exec(d.url.toLowerCase()), d.crossDomain = !(!i || i[1] === Ln[1] && i[2] === Ln[2] && (i[3] || ("http:" === i[1] ? "80": "443")) === (Ln[3] || ("http:" === Ln[1] ? "80": "443")))), d.data && d.processData && "string" != typeof d.data && (d.data = ot.param(d.data, d.traditional)), B(Vn, d, t, w), 2 === b) return w;
            u = d.global,
            u && 0 === ot.active++&&ot.event.trigger("ajaxStart"),
            d.type = d.type.toUpperCase(),
            d.hasContent = !zn.test(d.type),
            o = d.url,
            d.hasContent || (d.data && (o = d.url += (Mn.test(o) ? "&": "?") + d.data, delete d.data), d.cache === !1 && (d.url = On.test(o) ? o.replace(On, "$1_=" + Dn++) : o + (Mn.test(o) ? "&": "?") + "_=" + Dn++)),
            d.ifModified && (ot.lastModified[o] && w.setRequestHeader("If-Modified-Since", ot.lastModified[o]), ot.etag[o] && w.setRequestHeader("If-None-Match", ot.etag[o])),
            (d.data && d.hasContent && d.contentType !== !1 || t.contentType) && w.setRequestHeader("Content-Type", d.contentType),
            w.setRequestHeader("Accept", d.dataTypes[0] && d.accepts[d.dataTypes[0]] ? d.accepts[d.dataTypes[0]] + ("*" !== d.dataTypes[0] ? ", " + Un + "; q=0.01": "") : d.accepts["*"]);
            for (r in d.headers) w.setRequestHeader(r, d.headers[r]);
            if (d.beforeSend && (d.beforeSend.call(h, w, d) === !1 || 2 === b)) return w.abort();
            x = "abort";
            for (r in {
                success: 1,
                error: 1,
                complete: 1
            }) w[r](d[r]);
            if (l = B(Wn, d, t, w)) {
                w.readyState = 1,
                u && f.trigger("ajaxSend", [w, d]),
                d.async && d.timeout > 0 && (a = setTimeout(function() {
                    w.abort("timeout")
                },
                d.timeout));
                try {
                    b = 1,
                    l.send(v, n)
                } catch(C) {
                    if (! (2 > b)) throw C;
                    n( - 1, C)
                }
            } else n( - 1, "No Transport");
            return w
        },
        getJSON: function(e, t, n) {
            return ot.get(e, t, n, "json")
        },
        getScript: function(e, t) {
            return ot.get(e, void 0, t, "script")
        }
    }),
    ot.each(["get", "post"],
    function(e, t) {
        ot[t] = function(e, n, i, r) {
            return ot.isFunction(n) && (r = r || i, i = n, n = void 0),
            ot.ajax({
                url: e,
                type: t,
                dataType: r,
                data: n,
                success: i
            })
        }
    }),
    ot.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"],
    function(e, t) {
        ot.fn[t] = function(e) {
            return this.on(t, e)
        }
    }),
    ot._evalUrl = function(e) {
        return ot.ajax({
            url: e,
            type: "GET",
            dataType: "script",
            async: !1,
            global: !1,
            "throws": !0
        })
    },
    ot.fn.extend({
        wrapAll: function(e) {
            if (ot.isFunction(e)) return this.each(function(t) {
                ot(this).wrapAll(e.call(this, t))
            });
            if (this[0]) {
                var t = ot(e, this[0].ownerDocument).eq(0).clone(!0);
                this[0].parentNode && t.insertBefore(this[0]),
                t.map(function() {
                    for (var e = this; e.firstChild && 1 === e.firstChild.nodeType;) e = e.firstChild;
                    return e
                }).append(this)
            }
            return this
        },
        wrapInner: function(e) {
            return this.each(ot.isFunction(e) ?
            function(t) {
                ot(this).wrapInner(e.call(this, t))
            }: function() {
                var t = ot(this),
                n = t.contents();
                n.length ? n.wrapAll(e) : t.append(e)
            })
        },
        wrap: function(e) {
            var t = ot.isFunction(e);
            return this.each(function(n) {
                ot(this).wrapAll(t ? e.call(this, n) : e)
            })
        },
        unwrap: function() {
            return this.parent().each(function() {
                ot.nodeName(this, "body") || ot(this).replaceWith(this.childNodes)
            }).end()
        }
    }),
    ot.expr.filters.hidden = function(e) {
        return e.offsetWidth <= 0 && e.offsetHeight <= 0 || !it.reliableHiddenOffsets() && "none" === (e.style && e.style.display || ot.css(e, "display"))
    },
    ot.expr.filters.visible = function(e) {
        return ! ot.expr.filters.hidden(e)
    };
    var Jn = /%20/g,
    Qn = /\[\]$/,
    Gn = /\r?\n/g,
    Yn = /^(?:submit|button|image|reset|file)$/i,
    Kn = /^(?:input|select|textarea|keygen)/i;
    ot.param = function(e, t) {
        var n, i = [],
        r = function(e, t) {
            t = ot.isFunction(t) ? t() : null == t ? "": t,
            i[i.length] = encodeURIComponent(e) + "=" + encodeURIComponent(t)
        };
        if (void 0 === t && (t = ot.ajaxSettings && ot.ajaxSettings.traditional), ot.isArray(e) || e.jquery && !ot.isPlainObject(e)) ot.each(e,
        function() {
            r(this.name, this.value)
        });
        else for (n in e) V(n, e[n], t, r);
        return i.join("&").replace(Jn, "+")
    },
    ot.fn.extend({
        serialize: function() {
            return ot.param(this.serializeArray())
        },
        serializeArray: function() {
            return this.map(function() {
                var e = ot.prop(this, "elements");
                return e ? ot.makeArray(e) : this
            }).filter(function() {
                var e = this.type;
                return this.name && !ot(this).is(":disabled") && Kn.test(this.nodeName) && !Yn.test(e) && (this.checked || !At.test(e))
            }).map(function(e, t) {
                var n = ot(this).val();
                return null == n ? null: ot.isArray(n) ? ot.map(n,
                function(e) {
                    return {
                        name: t.name,
                        value: e.replace(Gn, "\r\n")
                    }
                }) : {
                    name: t.name,
                    value: n.replace(Gn, "\r\n")
                }
            }).get()
        }
    }),
    ot.ajaxSettings.xhr = void 0 !== e.ActiveXObject ?
    function() {
        return ! this.isLocal && /^(get|post|head|put|delete|options)$/i.test(this.type) && W() || U()
    }: W;
    var Zn = 0,
    ei = {},
    ti = ot.ajaxSettings.xhr();
    e.ActiveXObject && ot(e).on("unload",
    function() {
        for (var e in ei) ei[e](void 0, !0)
    }),
    it.cors = !!ti && "withCredentials" in ti,
    ti = it.ajax = !!ti,
    ti && ot.ajaxTransport(function(e) {
        if (!e.crossDomain || it.cors) {
            var t;
            return {
                send: function(n, i) {
                    var r, o = e.xhr(),
                    s = ++Zn;
                    if (o.open(e.type, e.url, e.async, e.username, e.password), e.xhrFields) for (r in e.xhrFields) o[r] = e.xhrFields[r];
                    e.mimeType && o.overrideMimeType && o.overrideMimeType(e.mimeType),
                    e.crossDomain || n["X-Requested-With"] || (n["X-Requested-With"] = "XMLHttpRequest");
                    for (r in n) void 0 !== n[r] && o.setRequestHeader(r, n[r] + "");
                    o.send(e.hasContent && e.data || null),
                    t = function(n, r) {
                        var a, u, l;
                        if (t && (r || 4 === o.readyState)) if (delete ei[s], t = void 0, o.onreadystatechange = ot.noop, r) 4 !== o.readyState && o.abort();
                        else {
                            l = {},
                            a = o.status,
                            "string" == typeof o.responseText && (l.text = o.responseText);
                            try {
                                u = o.statusText
                            } catch(c) {
                                u = ""
                            }
                            a || !e.isLocal || e.crossDomain ? 1223 === a && (a = 204) : a = l.text ? 200 : 404
                        }
                        l && i(a, u, l, o.getAllResponseHeaders())
                    },
                    e.async ? 4 === o.readyState ? setTimeout(t) : o.onreadystatechange = ei[s] = t: t()
                },
                abort: function() {
                    t && t(void 0, !0)
                }
            }
        }
    }),
    ot.ajaxSetup({
        accepts: {
            script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
        },
        contents: {
            script: /(?:java|ecma)script/
        },
        converters: {
            "text script": function(e) {
                return ot.globalEval(e),
                e
            }
        }
    }),
    ot.ajaxPrefilter("script",
    function(e) {
        void 0 === e.cache && (e.cache = !1),
        e.crossDomain && (e.type = "GET", e.global = !1)
    }),
    ot.ajaxTransport("script",
    function(e) {
        if (e.crossDomain) {
            var t, n = gt.head || ot("head")[0] || gt.documentElement;
            return {
                send: function(i, r) {
                    t = gt.createElement("script"),
                    t.async = !0,
                    e.scriptCharset && (t.charset = e.scriptCharset),
                    t.src = e.url,
                    t.onload = t.onreadystatechange = function(e, n) { (n || !t.readyState || /loaded|complete/.test(t.readyState)) && (t.onload = t.onreadystatechange = null, t.parentNode && t.parentNode.removeChild(t), t = null, n || r(200, "success"))
                    },
                    n.insertBefore(t, n.firstChild)
                },
                abort: function() {
                    t && t.onload(void 0, !0)
                }
            }
        }
    });
    var ni = [],
    ii = /(=)\?(?=&|$)|\?\?/;
    ot.ajaxSetup({
        jsonp: "callback",
        jsonpCallback: function() {
            var e = ni.pop() || ot.expando + "_" + Dn++;
            return this[e] = !0,
            e
        }
    }),
    ot.ajaxPrefilter("json jsonp",
    function(t, n, i) {
        var r, o, s, a = t.jsonp !== !1 && (ii.test(t.url) ? "url": "string" == typeof t.data && !(t.contentType || "").indexOf("application/x-www-form-urlencoded") && ii.test(t.data) && "data");
        return a || "jsonp" === t.dataTypes[0] ? (r = t.jsonpCallback = ot.isFunction(t.jsonpCallback) ? t.jsonpCallback() : t.jsonpCallback, a ? t[a] = t[a].replace(ii, "$1" + r) : t.jsonp !== !1 && (t.url += (Mn.test(t.url) ? "&": "?") + t.jsonp + "=" + r), t.converters["script json"] = function() {
            return s || ot.error(r + " was not called"),
            s[0]
        },
        t.dataTypes[0] = "json", o = e[r], e[r] = function() {
            s = arguments
        },
        i.always(function() {
            e[r] = o,
            t[r] && (t.jsonpCallback = n.jsonpCallback, ni.push(r)),
            s && ot.isFunction(o) && o(s[0]),
            s = o = void 0
        }), "script") : void 0
    }),
    ot.parseHTML = function(e, t, n) {
        if (!e || "string" != typeof e) return null;
        "boolean" == typeof t && (n = t, t = !1),
        t = t || gt;
        var i = ht.exec(e),
        r = !n && [];
        return i ? [t.createElement(i[1])] : (i = ot.buildFragment([e], t, r), r && r.length && ot(r).remove(), ot.merge([], i.childNodes))
    };
    var ri = ot.fn.load;
    ot.fn.load = function(e, t, n) {
        if ("string" != typeof e && ri) return ri.apply(this, arguments);
        var i, r, o, s = this,
        a = e.indexOf(" ");
        return a >= 0 && (i = e.slice(a, e.length), e = e.slice(0, a)),
        ot.isFunction(t) ? (n = t, t = void 0) : t && "object" == typeof t && (o = "POST"),
        s.length > 0 && ot.ajax({
            url: e,
            type: o,
            dataType: "html",
            data: t
        }).done(function(e) {
            r = arguments,
            s.html(i ? ot("<div>").append(ot.parseHTML(e)).find(i) : e)
        }).complete(n &&
        function(e, t) {
            s.each(n, r || [e.responseText, t, e])
        }),
        this
    },
    ot.expr.filters.animated = function(e) {
        return ot.grep(ot.timers,
        function(t) {
            return e === t.elem
        }).length
    };
    var oi = e.document.documentElement;
    ot.offset = {
        setOffset: function(e, t, n) {
            var i, r, o, s, a, u, l, c = ot.css(e, "position"),
            d = ot(e),
            h = {};
            "static" === c && (e.style.position = "relative"),
            a = d.offset(),
            o = ot.css(e, "top"),
            u = ot.css(e, "left"),
            l = ("absolute" === c || "fixed" === c) && ot.inArray("auto", [o, u]) > -1,
            l ? (i = d.position(), s = i.top, r = i.left) : (s = parseFloat(o) || 0, r = parseFloat(u) || 0),
            ot.isFunction(t) && (t = t.call(e, n, a)),
            null != t.top && (h.top = t.top - a.top + s),
            null != t.left && (h.left = t.left - a.left + r),
            "using" in t ? t.using.call(e, h) : d.css(h)
        }
    },
    ot.fn.extend({
        offset: function(e) {
            if (arguments.length) return void 0 === e ? this: this.each(function(t) {
                ot.offset.setOffset(this, e, t)
            });
            var t, n, i = {
                top: 0,
                left: 0
            },
            r = this[0],
            o = r && r.ownerDocument;
            if (o) return t = o.documentElement,
            ot.contains(t, r) ? (typeof r.getBoundingClientRect !== Et && (i = r.getBoundingClientRect()), n = X(o), {
                top: i.top + (n.pageYOffset || t.scrollTop) - (t.clientTop || 0),
                left: i.left + (n.pageXOffset || t.scrollLeft) - (t.clientLeft || 0)
            }) : i
        },
        position: function() {
            if (this[0]) {
                var e, t, n = {
                    top: 0,
                    left: 0
                },
                i = this[0];
                return "fixed" === ot.css(i, "position") ? t = i.getBoundingClientRect() : (e = this.offsetParent(), t = this.offset(), ot.nodeName(e[0], "html") || (n = e.offset()), n.top += ot.css(e[0], "borderTopWidth", !0), n.left += ot.css(e[0], "borderLeftWidth", !0)),
                {
                    top: t.top - n.top - ot.css(i, "marginTop", !0),
                    left: t.left - n.left - ot.css(i, "marginLeft", !0)
                }
            }
        },
        offsetParent: function() {
            return this.map(function() {
                for (var e = this.offsetParent || oi; e && !ot.nodeName(e, "html") && "static" === ot.css(e, "position");) e = e.offsetParent;
                return e || oi
            })
        }
    }),
    ot.each({
        scrollLeft: "pageXOffset",
        scrollTop: "pageYOffset"
    },
    function(e, t) {
        var n = /Y/.test(t);
        ot.fn[e] = function(i) {
            return jt(this,
            function(e, i, r) {
                var o = X(e);
                return void 0 === r ? o ? t in o ? o[t] : o.document.documentElement[i] : e[i] : void(o ? o.scrollTo(n ? ot(o).scrollLeft() : r, n ? r: ot(o).scrollTop()) : e[i] = r)
            },
            e, i, arguments.length, null)
        }
    }),
    ot.each(["top", "left"],
    function(e, t) {
        ot.cssHooks[t] = T(it.pixelPosition,
        function(e, n) {
            return n ? (n = nn(e, t), on.test(n) ? ot(e).position()[t] + "px": n) : void 0
        })
    }),
    ot.each({
        Height: "height",
        Width: "width"
    },
    function(e, t) {
        ot.each({
            padding: "inner" + e,
            content: t,
            "": "outer" + e
        },
        function(n, i) {
            ot.fn[i] = function(i, r) {
                var o = arguments.length && (n || "boolean" != typeof i),
                s = n || (i === !0 || r === !0 ? "margin": "border");
                return jt(this,
                function(t, n, i) {
                    var r;
                    return ot.isWindow(t) ? t.document.documentElement["client" + e] : 9 === t.nodeType ? (r = t.documentElement, Math.max(t.body["scroll" + e], r["scroll" + e], t.body["offset" + e], r["offset" + e], r["client" + e])) : void 0 === i ? ot.css(t, n, s) : ot.style(t, n, i, s)
                },
                t, o ? i: void 0, o, null)
            }
        })
    }),
    ot.fn.size = function() {
        return this.length
    },
    ot.fn.andSelf = ot.fn.addBack,
    "function" == typeof define && define.amd && define("jquery", [],
    function() {
        return ot
    });
    var si = e.jQuery,
    ai = e.$;
    return ot.noConflict = function(t) {
        return e.$ === ot && (e.$ = ai),
        t && e.jQuery === ot && (e.jQuery = si),
        ot
    },
    typeof t === Et && (e.jQuery = e.$ = ot),
    ot
}),
define("jquery",
function() {}),
function() {
    function e(e, t, n) {
        for (var i = (n || 0) - 1, r = e ? e.length: 0; ++i < r;) if (e[i] === t) return i;
        return - 1
    }
    function t(e, t) {
        for (var n = e.criteria,
        i = t.criteria,
        r = -1,
        o = n.length; ++r < o;) {
            var s = n[r],
            a = i[r];
            if (s !== a) {
                if (s > a || "undefined" == typeof s) return 1;
                if (a > s || "undefined" == typeof a) return - 1
            }
        }
        return e.index - t.index
    }
    function n(e) {
        return "\\" + Cn[e]
    }
    function i(e, t, n) {
        t || (t = 0),
        "undefined" == typeof n && (n = e ? e.length: 0);
        for (var i = -1,
        r = n - t || 0,
        o = Array(0 > r ? 0 : r); ++i < r;) o[i] = e[t + i];
        return o
    }
    function r(e) {
        return e instanceof r ? e: new o(e)
    }
    function o(e, t) {
        this.__chain__ = !!t,
        this.__wrapped__ = e
    }
    function s(e) {
        function t() {
            if (r) {
                var e = i(r);
                qn.apply(e, arguments)
            }
            if (this instanceof t) {
                var s = a(n.prototype),
                u = n.apply(s, e || arguments);
                return L(u) ? u: s
            }
            return n.apply(o, e || arguments)
        }
        var n = e[0],
        r = e[2],
        o = e[4];
        return t
    }
    function a(e) {
        return L(e) ? On(e) : {}
    }
    function u(e, t, n) {
        if ("function" != typeof e) return Vt;
        if ("undefined" == typeof t || !("prototype" in e)) return e;
        switch (n) {
        case 1:
            return function(n) {
                return e.call(t, n)
            };
        case 2:
            return function(n, i) {
                return e.call(t, n, i)
            };
        case 3:
            return function(n, i, r) {
                return e.call(t, n, i, r)
            };
        case 4:
            return function(n, i, r, o) {
                return e.call(t, n, i, r, o)
            }
        }
        return At(e, t)
    }
    function l(e) {
        function t() {
            var e = d ? u: this;
            if (o) {
                var m = i(o);
                qn.apply(m, arguments)
            }
            if ((s || f) && (m || (m = i(arguments)), s && qn.apply(m, s), f && m.length < c)) return r |= 16,
            l([n, p ? r: -4 & r, m, null, u, c]);
            if (m || (m = arguments), h && (n = e[g]), this instanceof t) {
                e = a(n.prototype);
                var v = n.apply(e, m);
                return L(v) ? v: e
            }
            return n.apply(e, m)
        }
        var n = e[0],
        r = e[1],
        o = e[2],
        s = e[3],
        u = e[4],
        c = e[5],
        d = 1 & r,
        h = 2 & r,
        f = 4 & r,
        p = 8 & r,
        g = n;
        return t
    }
    function c(e, t) {
        for (var n = -1,
        i = y(), r = e ? e.length: 0, o = []; ++n < r;) {
            var s = e[n];
            i(t, s) < 0 && o.push(s)
        }
        return o
    }
    function d(e, t, n, i) {
        for (var r = (i || 0) - 1, o = e ? e.length: 0, s = []; ++r < o;) {
            var a = e[r];
            if (a && "object" == typeof a && "number" == typeof a.length && (Xn(a) || w(a))) {
                t || (a = d(a, t, n));
                var u = -1,
                l = a.length,
                c = s.length;
                for (s.length += l; ++u < l;) s[c++] = a[u]
            } else n || s.push(a)
        }
        return s
    }
    function h(e, t, n, i) {
        if (e === t) return 0 !== e || 1 / e == 1 / t;
        var o = typeof e,
        s = typeof t;
        if (! (e !== e || e && wn[o] || t && wn[s])) return ! 1;
        if (null == e || null == t) return e === t;
        var a = An.call(e),
        u = An.call(t);
        if (a != u) return ! 1;
        switch (a) {
        case pn:
        case gn:
            return + e == +t;
        case vn:
            return e != +e ? t != +t: 0 == e ? 1 / e == 1 / t: e == +t;
        case bn:
        case xn:
            return e == String(t)
        }
        var l = a == fn;
        if (!l) {
            var c = e instanceof r,
            d = t instanceof r;
            if (c || d) return h(c ? e.__wrapped__: e, d ? t.__wrapped__: t, n, i);
            if (a != yn) return ! 1;
            var f = e.constructor,
            p = t.constructor;
            if (f != p && !(R(f) && f instanceof f && R(p) && p instanceof p) && "constructor" in e && "constructor" in t) return ! 1
        }
        n || (n = []),
        i || (i = []);
        for (var g = n.length; g--;) if (n[g] == e) return i[g] == t;
        var m = !0,
        v = 0;
        if (n.push(e), i.push(t), l) {
            if (v = t.length, m = v == e.length) for (; v--&&(m = h(e[v], t[v], n, i)););
        } else ei(t,
        function(t, r, o) {
            return Ln.call(o, r) ? (v++, !(m = Ln.call(e, r) && h(e[r], t, n, i)) && an) : void 0
        }),
        m && ei(e,
        function(e, t, n) {
            return Ln.call(n, t) ? !(m = --v > -1) && an: void 0
        });
        return n.pop(),
        i.pop(),
        m
    }
    function f(e, t) {
        return e + Rn(Wn() * (t - e + 1))
    }
    function p(e, t, n) {
        for (var i = -1,
        r = y(), o = e ? e.length: 0, s = [], a = n ? [] : s; ++i < o;) {
            var u = e[i],
            l = n ? n(u, i, e) : u; (t ? !i || a[a.length - 1] !== l: r(a, l) < 0) && (n && a.push(l), s.push(u))
        }
        return s
    }
    function g(e) {
        return function(t, n, i) {
            var r = {};
            n = Pt(n, i, 3);
            var o = -1,
            s = t ? t.length: 0;
            if ("number" == typeof s) for (; ++o < s;) {
                var a = t[o];
                e(r, a, n(a, o, t), t)
            } else ti(t,
            function(t, i, o) {
                e(r, t, n(t, i, o), o)
            });
            return r
        }
    }
    function m(e, t, n, i, r, o) {
        var a = 2 & t,
        u = 16 & t,
        c = 32 & t;
        if (!a && !R(e)) throw new TypeError;
        u && !n.length && (t &= -17, u = n = !1),
        c && !i.length && (t &= -33, c = i = !1);
        var d = 1 == t || 17 === t ? s: l;
        return d([e, t, n, i, r, o])
    }
    function v(e) {
        return Gn[e]
    }
    function y() {
        var t = (t = r.indexOf) === vt ? e: t;
        return t
    }
    function b(e) {
        return "function" == typeof e && Dn.test(e)
    }
    function x(e) {
        return Yn[e]
    }
    function w(e) {
        return e && "object" == typeof e && "number" == typeof e.length && An.call(e) == hn || !1
    }
    function C(e) {
        if (!e) return e;
        for (var t = 1,
        n = arguments.length; n > t; t++) {
            var i = arguments[t];
            if (i) for (var r in i) e[r] = i[r]
        }
        return e
    }
    function _(e) {
        return L(e) ? Xn(e) ? i(e) : C({},
        e) : e
    }
    function E(e) {
        if (!e) return e;
        for (var t = 1,
        n = arguments.length; n > t; t++) {
            var i = arguments[t];
            if (i) for (var r in i)"undefined" == typeof e[r] && (e[r] = i[r])
        }
        return e
    }
    function F(e) {
        var t = [];
        return ei(e,
        function(e, n) {
            R(e) && t.push(n)
        }),
        t.sort()
    }
    function T(e, t) {
        return e ? Ln.call(e, t) : !1
    }
    function k(e) {
        for (var t = -1,
        n = Qn(e), i = n.length, r = {}; ++t < i;) {
            var o = n[t];
            r[e[o]] = o
        }
        return r
    }
    function S(e) {
        return e === !0 || e === !1 || e && "object" == typeof e && An.call(e) == pn || !1
    }
    function N(e) {
        return e && "object" == typeof e && An.call(e) == gn || !1
    }
    function j(e) {
        return e && 1 === e.nodeType || !1
    }
    function A(e) {
        if (!e) return ! 0;
        if (Xn(e) || B(e)) return ! e.length;
        for (var t in e) if (Ln.call(e, t)) return ! 1;
        return ! 0
    }
    function D(e, t) {
        return h(e, t)
    }
    function M(e) {
        return Bn(e) && !zn(parseFloat(e))
    }
    function R(e) {
        return "function" == typeof e
    }
    function L(e) {
        return ! (!e || !wn[typeof e])
    }
    function q(e) {
        return O(e) && e != +e
    }
    function H(e) {
        return null === e
    }
    function O(e) {
        return "number" == typeof e || e && "object" == typeof e && An.call(e) == vn || !1
    }
    function I(e) {
        return e && wn[typeof e] && An.call(e) == bn || !1
    }
    function B(e) {
        return "string" == typeof e || e && "object" == typeof e && An.call(e) == xn || !1
    }
    function z(e) {
        return "undefined" == typeof e
    }
    function P(e) {
        var t = [];
        ei(e,
        function(e, n) {
            t.push(n)
        }),
        t = c(t, d(arguments, !0, !1, 1));
        for (var n = -1,
        i = t.length,
        r = {}; ++n < i;) {
            var o = t[n];
            r[o] = e[o]
        }
        return r
    }
    function $(e) {
        for (var t = -1,
        n = Qn(e), i = n.length, r = Array(i); ++t < i;) {
            var o = n[t];
            r[t] = [o, e[o]]
        }
        return r
    }
    function V(e) {
        for (var t = -1,
        n = d(arguments, !0, !1, 1), i = n.length, r = {}; ++t < i;) {
            var o = n[t];
            o in e && (r[o] = e[o])
        }
        return r
    }
    function W(e) {
        for (var t = -1,
        n = Qn(e), i = n.length, r = Array(i); ++t < i;) r[t] = e[n[t]];
        return r
    }
    function U(e, t) {
        var n = y(),
        i = e ? e.length: 0,
        r = !1;
        return i && "number" == typeof i ? r = n(e, t) > -1 : ti(e,
        function(e) {
            return (r = e === t) && an
        }),
        r
    }
    function X(e, t, n) {
        var i = !0;
        t = Pt(t, n, 3);
        var r = -1,
        o = e ? e.length: 0;
        if ("number" == typeof o) for (; ++r < o && (i = !!t(e[r], r, e)););
        else ti(e,
        function(e, n, r) {
            return ! (i = !!t(e, n, r)) && an
        });
        return i
    }
    function J(e, t, n) {
        var i = [];
        t = Pt(t, n, 3);
        var r = -1,
        o = e ? e.length: 0;
        if ("number" == typeof o) for (; ++r < o;) {
            var s = e[r];
            t(s, r, e) && i.push(s)
        } else ti(e,
        function(e, n, r) {
            t(e, n, r) && i.push(e)
        });
        return i
    }
    function Q(e, t, n) {
        t = Pt(t, n, 3);
        var i = -1,
        r = e ? e.length: 0;
        if ("number" != typeof r) {
            var o;
            return ti(e,
            function(e, n, i) {
                return t(e, n, i) ? (o = e, an) : void 0
            }),
            o
        }
        for (; ++i < r;) {
            var s = e[i];
            if (t(s, i, e)) return s
        }
    }
    function G(e, t) {
        return ht(e, t, !0)
    }
    function Y(e, t, n) {
        var i = -1,
        r = e ? e.length: 0;
        if (t = t && "undefined" == typeof n ? t: u(t, n, 3), "number" == typeof r) for (; ++i < r && t(e[i], i, e) !== an;);
        else ti(e, t)
    }
    function K(e, t) {
        var n = e ? e.length: 0;
        if ("number" == typeof n) for (; n--&&t(e[n], n, e) !== !1;);
        else {
            var i = Qn(e);
            n = i.length,
            ti(e,
            function(e, r, o) {
                return r = i ? i[--n] : --n,
                t(o[r], r, o) === !1 && an
            })
        }
    }
    function Z(e, t) {
        var n = i(arguments, 2),
        r = -1,
        o = "function" == typeof t,
        s = e ? e.length: 0,
        a = Array("number" == typeof s ? s: 0);
        return Y(e,
        function(e) {
            a[++r] = (o ? t: e[t]).apply(e, n)
        }),
        a
    }
    function et(e, t, n) {
        var i = -1,
        r = e ? e.length: 0;
        if (t = Pt(t, n, 3), "number" == typeof r) for (var o = Array(r); ++i < r;) o[i] = t(e[i], i, e);
        else o = [],
        ti(e,
        function(e, n, r) {
            o[++i] = t(e, n, r)
        });
        return o
    }
    function tt(e, t, n) {
        var i = -1 / 0,
        r = i;
        "function" != typeof t && n && n[t] === e && (t = null);
        var o = -1,
        s = e ? e.length: 0;
        if (null == t && "number" == typeof s) for (; ++o < s;) {
            var a = e[o];
            a > r && (r = a)
        } else t = Pt(t, n, 3),
        Y(e,
        function(e, n, o) {
            var s = t(e, n, o);
            s > i && (i = s, r = e)
        });
        return r
    }
    function nt(e, t, n) {
        var i = 1 / 0,
        r = i;
        "function" != typeof t && n && n[t] === e && (t = null);
        var o = -1,
        s = e ? e.length: 0;
        if (null == t && "number" == typeof s) for (; ++o < s;) {
            var a = e[o];
            r > a && (r = a)
        } else t = Pt(t, n, 3),
        Y(e,
        function(e, n, o) {
            var s = t(e, n, o);
            i > s && (i = s, r = e)
        });
        return r
    }
    function it(e, t, n, i) {
        if (!e) return n;
        var r = arguments.length < 3;
        t = Pt(t, i, 4);
        var o = -1,
        s = e.length;
        if ("number" == typeof s) for (r && (n = e[++o]); ++o < s;) n = t(n, e[o], o, e);
        else ti(e,
        function(e, i, o) {
            n = r ? (r = !1, e) : t(n, e, i, o)
        });
        return n
    }
    function rt(e, t, n, i) {
        var r = arguments.length < 3;
        return t = Pt(t, i, 4),
        K(e,
        function(e, i, o) {
            n = r ? (r = !1, e) : t(n, e, i, o)
        }),
        n
    }
    function ot(e, t, n) {
        return t = Pt(t, n, 3),
        J(e,
        function(e, n, i) {
            return ! t(e, n, i)
        })
    }
    function st(e, t, n) {
        if (e && "number" != typeof e.length && (e = W(e)), null == t || n) return e ? e[f(0, e.length - 1)] : on;
        var i = at(e);
        return i.length = Vn($n(0, t), i.length),
        i
    }
    function at(e) {
        var t = -1,
        n = e ? e.length: 0,
        i = Array("number" == typeof n ? n: 0);
        return Y(e,
        function(e) {
            var n = f(0, ++t);
            i[t] = i[n],
            i[n] = e
        }),
        i
    }
    function ut(e) {
        var t = e ? e.length: 0;
        return "number" == typeof t ? t: Qn(e).length
    }
    function lt(e, t, n) {
        var i;
        t = Pt(t, n, 3);
        var r = -1,
        o = e ? e.length: 0;
        if ("number" == typeof o) for (; ++r < o && !(i = t(e[r], r, e)););
        else ti(e,
        function(e, n, r) {
            return (i = t(e, n, r)) && an
        });
        return !! i
    }
    function ct(e, n, i) {
        var r = -1,
        o = e ? e.length: 0,
        s = Array("number" == typeof o ? o: 0);
        for (n = Pt(n, i, 3), Y(e,
        function(e, t, i) {
            s[++r] = {
                criteria: [n(e, t, i)],
                index: r,
                value: e
            }
        }), o = s.length, s.sort(t); o--;) s[o] = s[o].value;
        return s
    }
    function dt(e) {
        return Xn(e) ? i(e) : e && "number" == typeof e.length ? et(e) : W(e)
    }
    function ht(e, t, n) {
        return n && A(t) ? on: (n ? Q: J)(e, t)
    }
    function ft(e) {
        for (var t = -1,
        n = e ? e.length: 0, i = []; ++t < n;) {
            var r = e[t];
            r && i.push(r)
        }
        return i
    }
    function pt(e) {
        return c(e, d(arguments, !0, !0, 1))
    }
    function gt(e, t, n) {
        var r = 0,
        o = e ? e.length: 0;
        if ("number" != typeof t && null != t) {
            var s = -1;
            for (t = Pt(t, n, 3); ++s < o && t(e[s], s, e);) r++
        } else if (r = t, null == r || n) return e ? e[0] : on;
        return i(e, 0, Vn($n(0, r), o))
    }
    function mt(e, t) {
        return d(e, t)
    }
    function vt(t, n, i) {
        if ("number" == typeof i) {
            var r = t ? t.length: 0;
            i = 0 > i ? $n(0, r + i) : i || 0
        } else if (i) {
            var o = Et(t, n);
            return t[o] === n ? o: -1
        }
        return e(t, n, i)
    }
    function yt(e, t, n) {
        var r = 0,
        o = e ? e.length: 0;
        if ("number" != typeof t && null != t) {
            var s = o;
            for (t = Pt(t, n, 3); s--&&t(e[s], s, e);) r++
        } else r = null == t || n ? 1 : t || r;
        return i(e, 0, Vn($n(0, o - r), o))
    }
    function bt() {
        for (var e = [], t = -1, n = arguments.length; ++t < n;) {
            var i = arguments[t]; (Xn(i) || w(i)) && e.push(i)
        }
        var r = e[0],
        o = -1,
        s = y(),
        a = r ? r.length: 0,
        u = [];
        e: for (; ++o < a;) if (i = r[o], s(u, i) < 0) {
            for (var t = n; --t;) if (s(e[t], i) < 0) continue e;
            u.push(i)
        }
        return u
    }
    function xt(e, t, n) {
        var r = 0,
        o = e ? e.length: 0;
        if ("number" != typeof t && null != t) {
            var s = o;
            for (t = Pt(t, n, 3); s--&&t(e[s], s, e);) r++
        } else if (r = t, null == r || n) return e ? e[o - 1] : on;
        return i(e, $n(0, o - r))
    }
    function wt(e, t, n) {
        var i = e ? e.length: 0;
        for ("number" == typeof n && (i = (0 > n ? $n(0, i + n) : Vn(n, i - 1)) + 1); i--;) if (e[i] === t) return i;
        return - 1
    }
    function Ct(e, t, n) {
        e = +e || 0,
        n = +n || 1,
        null == t && (t = e, e = 0);
        for (var i = -1,
        r = $n(0, Mn((t - e) / n)), o = Array(r); ++i < r;) o[i] = e,
        e += n;
        return o
    }
    function _t(e, t, n) {
        if ("number" != typeof t && null != t) {
            var r = 0,
            o = -1,
            s = e ? e.length: 0;
            for (t = Pt(t, n, 3); ++o < s && t(e[o], o, e);) r++
        } else r = null == t || n ? 1 : $n(0, t);
        return i(e, r)
    }
    function Et(e, t, n, i) {
        var r = 0,
        o = e ? e.length: r;
        for (n = n ? Pt(n, i, 1) : Vt, t = n(t); o > r;) {
            var s = r + o >>> 1;
            n(e[s]) < t ? r = s + 1 : o = s
        }
        return r
    }
    function Ft() {
        return p(d(arguments, !0, !0))
    }
    function Tt(e, t, n, i) {
        return "boolean" != typeof t && null != t && (i = n, n = "function" != typeof t && i && i[t] === e ? null: t, t = !1),
        null != n && (n = Pt(n, i, 3)),
        p(e, t, n)
    }
    function kt(e) {
        return c(e, i(arguments, 1))
    }
    function St() {
        for (var e = -1,
        t = tt(oi(arguments, "length")), n = Array(0 > t ? 0 : t); ++e < t;) n[e] = oi(arguments, e);
        return n
    }
    function Nt(e, t) {
        var n = -1,
        i = e ? e.length: 0,
        r = {};
        for (t || !i || Xn(e[0]) || (t = []); ++n < i;) {
            var o = e[n];
            t ? r[o] = t[n] : o && (r[o[0]] = o[1])
        }
        return r
    }
    function jt(e, t) {
        if (!R(t)) throw new TypeError;
        return function() {
            return--e < 1 ? t.apply(this, arguments) : void 0
        }
    }
    function At(e, t) {
        return arguments.length > 2 ? m(e, 17, i(arguments, 2), null, t) : m(e, 1, null, null, t)
    }
    function Dt(e) {
        for (var t = arguments.length > 1 ? d(arguments, !0, !1, 1) : F(e), n = -1, i = t.length; ++n < i;) {
            var r = t[n];
            e[r] = m(e[r], 1, null, null, e)
        }
        return e
    }
    function Mt() {
        for (var e = arguments,
        t = e.length; t--;) if (!R(e[t])) throw new TypeError;
        return function() {
            for (var t = arguments,
            n = e.length; n--;) t = [e[n].apply(this, t)];
            return t[0]
        }
    }
    function Rt(e, t, n) {
        var i, r, o, s, a, u, l, c = 0,
        d = !1,
        h = !0;
        if (!R(e)) throw new TypeError;
        if (t = $n(0, t) || 0, n === !0) {
            var f = !0;
            h = !1
        } else L(n) && (f = n.leading, d = "maxWait" in n && ($n(t, n.maxWait) || 0), h = "trailing" in n ? n.trailing: h);
        var p = function() {
            var n = t - (si() - s);
            if (0 >= n) {
                r && clearTimeout(r);
                var d = l;
                r = u = l = on,
                d && (c = si(), o = e.apply(a, i), u || r || (i = a = null))
            } else u = setTimeout(p, n)
        },
        g = function() {
            u && clearTimeout(u),
            r = u = l = on,
            (h || d !== t) && (c = si(), o = e.apply(a, i), u || r || (i = a = null))
        };
        return function() {
            if (i = arguments, s = si(), a = this, l = h && (u || !f), d === !1) var n = f && !u;
            else {
                r || f || (c = s);
                var m = d - (s - c),
                v = 0 >= m;
                v ? (r && (r = clearTimeout(r)), c = s, o = e.apply(a, i)) : r || (r = setTimeout(g, m))
            }
            return v && u ? u = clearTimeout(u) : u || t === d || (u = setTimeout(p, t)),
            n && (v = !0, o = e.apply(a, i)),
            !v || u || r || (i = a = null),
            o
        }
    }
    function Lt(e) {
        if (!R(e)) throw new TypeError;
        var t = i(arguments, 1);
        return setTimeout(function() {
            e.apply(on, t)
        },
        1)
    }
    function qt(e, t) {
        if (!R(e)) throw new TypeError;
        var n = i(arguments, 2);
        return setTimeout(function() {
            e.apply(on, n)
        },
        t)
    }
    function Ht(e, t) {
        var n = {};
        return function() {
            var i = t ? t.apply(this, arguments) : un + arguments[0];
            return Ln.call(n, i) ? n[i] : n[i] = e.apply(this, arguments)
        }
    }
    function Ot(e) {
        var t, n;
        if (!R(e)) throw new TypeError;
        return function() {
            return t ? n: (t = !0, n = e.apply(this, arguments), e = null, n)
        }
    }
    function It(e) {
        return m(e, 16, i(arguments, 1))
    }
    function Bt(e, t, n) {
        var i = !0,
        r = !0;
        if (!R(e)) throw new TypeError;
        return n === !1 ? i = !1 : L(n) && (i = "leading" in n ? n.leading: i, r = "trailing" in n ? n.trailing: r),
        n = {},
        n.leading = i,
        n.maxWait = t,
        n.trailing = r,
        Rt(e, t, n)
    }
    function zt(e, t) {
        return m(t, 16, [e])
    }
    function Pt(e, t, n) {
        var i = typeof e;
        if (null == e || "function" == i) return u(e, t, n);
        if ("object" != i) return Xt(e);
        var r = Qn(e);
        return function(t) {
            for (var n = r.length,
            i = !1; n--&&(i = t[r[n]] === e[r[n]]););
            return i
        }
    }
    function $t(e) {
        return null == e ? "": String(e).replace(Zn, v)
    }
    function Vt(e) {
        return e
    }
    function Wt(e) {
        Y(F(e),
        function(t) {
            var n = r[t] = e[t];
            r.prototype[t] = function() {
                var e = [this.__wrapped__];
                qn.apply(e, arguments);
                var t = n.apply(r, e);
                return this.__chain__ ? new o(t, !0) : t
            }
        })
    }
    function Ut() {
        return _n._ = jn,
        this
    }
    function Xt(e) {
        return function(t) {
            return t[e]
        }
    }
    function Jt(e, t) {
        return null == e && null == t && (t = 1),
        e = +e || 0,
        null == t ? (t = e, e = 0) : t = +t || 0,
        e + Rn(Wn() * (t - e + 1))
    }
    function Qt(e, t) {
        if (e) {
            var n = e[t];
            return R(n) ? e[t]() : n
        }
    }
    function Gt(e, t, i) {
        var o = r,
        s = o.templateSettings;
        e = String(e || ""),
        i = E({},
        i, s);
        var a = 0,
        u = "__p += '",
        l = i.variable,
        c = RegExp((i.escape || cn).source + "|" + (i.interpolate || cn).source + "|" + (i.evaluate || cn).source + "|$", "g");
        e.replace(c,
        function(t, i, r, o, s) {
            return u += e.slice(a, s).replace(dn, n),
            i && (u += "' +\n_.escape(" + i + ") +\n'"),
            o && (u += "';\n" + o + ";\n__p += '"),
            r && (u += "' +\n((__t = (" + r + ")) == null ? '' : __t) +\n'"),
            a = s + t.length,
            t
        }),
        u += "';\n",
        l || (l = "obj", u = "with (" + l + " || {}) {\n" + u + "\n}\n"),
        u = "function(" + l + ") {\nvar __t, __p = '', __j = Array.prototype.join;\nfunction print() { __p += __j.call(arguments, '') }\n" + u + "return __p\n}";
        try {
            var d = Function("_", "return " + u)(o)
        } catch(h) {
            throw h.source = u,
            h
        }
        return t ? d(t) : (d.source = u, d)
    }
    function Yt(e, t, n) {
        e = (e = +e) > -1 ? e: 0;
        var i = -1,
        r = Array(e);
        for (t = u(t, n, 1); ++i < e;) r[i] = t(i);
        return r
    }
    function Kt(e) {
        return null == e ? "": String(e).replace(Kn, x)
    }
    function Zt(e) {
        var t = ++sn + "";
        return e ? e + t: t
    }
    function en(e) {
        return e = new o(e),
        e.__chain__ = !0,
        e
    }
    function tn(e, t) {
        return t(e),
        e
    }
    function nn() {
        return this.__chain__ = !0,
        this
    }
    function rn() {
        return this.__wrapped__
    }
    var on, sn = 0,
    an = {},
    un = +new Date + "",
    ln = /<%=([\s\S]+?)%>/g,
    cn = /($^)/,
    dn = /['\n\r\t\u2028\u2029\\]/g,
    hn = "[object Arguments]",
    fn = "[object Array]",
    pn = "[object Boolean]",
    gn = "[object Date]",
    mn = "[object Function]",
    vn = "[object Number]",
    yn = "[object Object]",
    bn = "[object RegExp]",
    xn = "[object String]",
    wn = {
        "boolean": !1,
        "function": !0,
        object: !0,
        number: !1,
        string: !1,
        undefined: !1
    },
    Cn = {
        "\\": "\\",
        "'": "'",
        "\n": "n",
        "\r": "r",
        "	": "t",
        "\u2028": "u2028",
        "\u2029": "u2029"
    },
    _n = wn[typeof window] && window || this,
    En = wn[typeof exports] && exports && !exports.nodeType && exports,
    Fn = wn[typeof module] && module && !module.nodeType && module,
    Tn = Fn && Fn.exports === En && En,
    kn = wn[typeof global] && global; ! kn || kn.global !== kn && kn.window !== kn || (_n = kn);
    var Sn = [],
    Nn = Object.prototype,
    jn = _n._,
    An = Nn.toString,
    Dn = RegExp("^" + String(An).replace(/[.*+?^${}()|[\]\\]/g, "\\$&").replace(/toString| for [^\]]+/g, ".*?") + "$"),
    Mn = Math.ceil,
    Rn = Math.floor,
    Ln = Nn.hasOwnProperty,
    qn = Sn.push,
    Hn = Nn.propertyIsEnumerable,
    On = b(On = Object.create) && On,
    In = b(In = Array.isArray) && In,
    Bn = _n.isFinite,
    zn = _n.isNaN,
    Pn = b(Pn = Object.keys) && Pn,
    $n = Math.max,
    Vn = Math.min,
    Wn = Math.random;
    o.prototype = r.prototype;
    var Un = {}; !
    function() {
        var e = {
            0 : 1,
            length: 1
        };
        Un.spliceObjects = (Sn.splice.call(e, 0, 1), !e[0])
    } (1),
    r.templateSettings = {
        escape: /<%-([\s\S]+?)%>/g,
        evaluate: /<%([\s\S]+?)%>/g,
        interpolate: ln,
        variable: ""
    },
    On || (a = function() {
        function e() {}
        return function(t) {
            if (L(t)) {
                e.prototype = t;
                var n = new e;
                e.prototype = null
            }
            return n || _n.Object()
        }
    } ()),
    w(arguments) || (w = function(e) {
        return e && "object" == typeof e && "number" == typeof e.length && Ln.call(e, "callee") && !Hn.call(e, "callee") || !1
    });
    var Xn = In ||
    function(e) {
        return e && "object" == typeof e && "number" == typeof e.length && An.call(e) == fn || !1
    },
    Jn = function(e) {
        var t, n = e,
        i = [];
        if (!n) return i;
        if (!wn[typeof e]) return i;
        for (t in n) Ln.call(n, t) && i.push(t);
        return i
    },
    Qn = Pn ?
    function(e) {
        return L(e) ? Pn(e) : []
    }: Jn,
    Gn = {
        "&": "&amp;",
        "<": "&lt;",
        ">": "&gt;",
        '"': "&quot;",
        "'": "&#x27;"
    },
    Yn = k(Gn),
    Kn = RegExp("(" + Qn(Yn).join("|") + ")", "g"),
    Zn = RegExp("[" + Qn(Gn).join("") + "]", "g"),
    ei = function(e, t) {
        var n, i = e,
        r = i;
        if (!i) return r;
        if (!wn[typeof i]) return r;
        for (n in i) if (t(i[n], n, e) === an) return r;
        return r
    },
    ti = function(e, t) {
        var n, i = e,
        r = i;
        if (!i) return r;
        if (!wn[typeof i]) return r;
        for (n in i) if (Ln.call(i, n) && t(i[n], n, e) === an) return r;
        return r
    };
    R(/x/) && (R = function(e) {
        return "function" == typeof e && An.call(e) == mn
    });
    var ni = g(function(e, t, n) {
        Ln.call(e, n) ? e[n]++:e[n] = 1
    }),
    ii = g(function(e, t, n) { (Ln.call(e, n) ? e[n] : e[n] = []).push(t)
    }),
    ri = g(function(e, t, n) {
        e[n] = t
    }),
    oi = et,
    si = b(si = Date.now) && si ||
    function() {
        return (new Date).getTime()
    };
    r.after = jt,
    r.bind = At,
    r.bindAll = Dt,
    r.chain = en,
    r.compact = ft,
    r.compose = Mt,
    r.countBy = ni,
    r.debounce = Rt,
    r.defaults = E,
    r.defer = Lt,
    r.delay = qt,
    r.difference = pt,
    r.filter = J,
    r.flatten = mt,
    r.forEach = Y,
    r.functions = F,
    r.groupBy = ii,
    r.indexBy = ri,
    r.initial = yt,
    r.intersection = bt,
    r.invert = k,
    r.invoke = Z,
    r.keys = Qn,
    r.map = et,
    r.max = tt,
    r.memoize = Ht,
    r.min = nt,
    r.omit = P,
    r.once = Ot,
    r.pairs = $,
    r.partial = It,
    r.pick = V,
    r.pluck = oi,
    r.range = Ct,
    r.reject = ot,
    r.rest = _t,
    r.shuffle = at,
    r.sortBy = ct,
    r.tap = tn,
    r.throttle = Bt,
    r.times = Yt,
    r.toArray = dt,
    r.union = Ft,
    r.uniq = Tt,
    r.values = W,
    r.where = ht,
    r.without = kt,
    r.wrap = zt,
    r.zip = St,
    r.collect = et,
    r.drop = _t,
    r.each = Y,
    r.extend = C,
    r.methods = F,
    r.object = Nt,
    r.select = J,
    r.tail = _t,
    r.unique = Tt,
    r.clone = _,
    r.contains = U,
    r.escape = $t,
    r.every = X,
    r.find = Q,
    r.has = T,
    r.identity = Vt,
    r.indexOf = vt,
    r.isArguments = w,
    r.isArray = Xn,
    r.isBoolean = S,
    r.isDate = N,
    r.isElement = j,
    r.isEmpty = A,
    r.isEqual = D,
    r.isFinite = M,
    r.isFunction = R,
    r.isNaN = q,
    r.isNull = H,
    r.isNumber = O,
    r.isObject = L,
    r.isRegExp = I,
    r.isString = B,
    r.isUndefined = z,
    r.lastIndexOf = wt,
    r.mixin = Wt,
    r.noConflict = Ut,
    r.random = Jt,
    r.reduce = it,
    r.reduceRight = rt,
    r.result = Qt,
    r.size = ut,
    r.some = lt,
    r.sortedIndex = Et,
    r.template = Gt,
    r.unescape = Kt,
    r.uniqueId = Zt,
    r.all = X,
    r.any = lt,
    r.detect = Q,
    r.findWhere = G,
    r.foldl = it,
    r.foldr = rt,
    r.include = U,
    r.inject = it,
    r.first = gt,
    r.last = xt,
    r.sample = st,
    r.take = gt,
    r.head = gt,
    Wt(r),
    r.VERSION = "2.4.1",
    r.prototype.chain = nn,
    r.prototype.value = rn,
    Y(["pop", "push", "reverse", "shift", "sort", "splice", "unshift"],
    function(e) {
        var t = Sn[e];
        r.prototype[e] = function() {
            var e = this.__wrapped__;
            return t.apply(e, arguments),
            Un.spliceObjects || 0 !== e.length || delete e[0],
            this
        }
    }),
    Y(["concat", "join", "slice"],
    function(e) {
        var t = Sn[e];
        r.prototype[e] = function() {
            var e = this.__wrapped__,
            n = t.apply(e, arguments);
            return this.__chain__ && (n = new o(n), n.__chain__ = !0),
            n
        }
    }),
    "function" == typeof define && "object" == typeof define.amd && define.amd ? (_n._ = r, define("underscore", [],
    function() {
        return r
    })) : En && Fn ? Tn ? (Fn.exports = r)._ = r: En._ = r: _n._ = r
}.call(this),
function() {
    {
        var e, t = this,
        n = t.Backbone,
        i = [],
        r = (i.push, i.slice);
        i.splice
    }
    e = "undefined" != typeof exports ? exports: t.Backbone = {},
    e.VERSION = "1.1.0";
    var o = t._;
    o || "undefined" == typeof require || (o = require("underscore")),
    e.$ = t.jQuery || t.Zepto || t.ender || t.$,
    e.noConflict = function() {
        return t.Backbone = n,
        this
    },
    e.emulateHTTP = !1,
    e.emulateJSON = !1;
    var s = e.Events = {
        on: function(e, t, n) {
            if (!u(this, "on", e, [t, n]) || !t) return this;
            this._events || (this._events = {});
            var i = this._events[e] || (this._events[e] = []);
            return i.push({
                callback: t,
                context: n,
                ctx: n || this
            }),
            this
        },
        once: function(e, t, n) {
            if (!u(this, "once", e, [t, n]) || !t) return this;
            var i = this,
            r = o.once(function() {
                i.off(e, r),
                t.apply(this, arguments)
            });
            return r._callback = t,
            this.on(e, r, n)
        },
        off: function(e, t, n) {
            var i, r, s, a, l, c, d, h;
            if (!this._events || !u(this, "off", e, [t, n])) return this;
            if (!e && !t && !n) return this._events = {},
            this;
            for (a = e ? [e] : o.keys(this._events), l = 0, c = a.length; c > l; l++) if (e = a[l], s = this._events[e]) {
                if (this._events[e] = i = [], t || n) for (d = 0, h = s.length; h > d; d++) r = s[d],
                (t && t !== r.callback && t !== r.callback._callback || n && n !== r.context) && i.push(r);
                i.length || delete this._events[e]
            }
            return this
        },
        trigger: function(e) {
            if (!this._events) return this;
            var t = r.call(arguments, 1);
            if (!u(this, "trigger", e, t)) return this;
            var n = this._events[e],
            i = this._events.all;
            return n && l(n, t),
            i && l(i, arguments),
            this
        },
        stopListening: function(e, t, n) {
            var i = this._listeningTo;
            if (!i) return this;
            var r = !t && !n;
            n || "object" != typeof t || (n = this),
            e && ((i = {})[e._listenId] = e);
            for (var s in i) e = i[s],
            e.off(t, n, this),
            (r || o.isEmpty(e._events)) && delete this._listeningTo[s];
            return this
        }
    },
    a = /\s+/,
    u = function(e, t, n, i) {
        if (!n) return ! 0;
        if ("object" == typeof n) {
            for (var r in n) e[t].apply(e, [r, n[r]].concat(i));
            return ! 1
        }
        if (a.test(n)) {
            for (var o = n.split(a), s = 0, u = o.length; u > s; s++) e[t].apply(e, [o[s]].concat(i));
            return ! 1
        }
        return ! 0
    },
    l = function(e, t) {
        var n, i = -1,
        r = e.length,
        o = t[0],
        s = t[1],
        a = t[2];
        switch (t.length) {
        case 0:
            for (; ++i < r;)(n = e[i]).callback.call(n.ctx);
            return;
        case 1:
            for (; ++i < r;)(n = e[i]).callback.call(n.ctx, o);
            return;
        case 2:
            for (; ++i < r;)(n = e[i]).callback.call(n.ctx, o, s);
            return;
        case 3:
            for (; ++i < r;)(n = e[i]).callback.call(n.ctx, o, s, a);
            return;
        default:
            for (; ++i < r;)(n = e[i]).callback.apply(n.ctx, t)
        }
    },
    c = {
        listenTo: "on",
        listenToOnce: "once"
    };
    o.each(c,
    function(e, t) {
        s[t] = function(t, n, i) {
            var r = this._listeningTo || (this._listeningTo = {}),
            s = t._listenId || (t._listenId = o.uniqueId("l"));
            return r[s] = t,
            i || "object" != typeof n || (i = this),
            t[e](n, i, this),
            this
        }
    }),
    s.bind = s.on,
    s.unbind = s.off,
    o.extend(e, s);
    var d = e.Model = function(e, t) {
        var n = e || {};
        t || (t = {}),
        this.cid = o.uniqueId("c"),
        this.attributes = {},
        t.collection && (this.collection = t.collection),
        t.parse && (n = this.parse(n, t) || {}),
        n = o.defaults({},
        n, o.result(this, "defaults")),
        this.set(n, t),
        this.changed = {},
        this.initialize.apply(this, arguments)
    };
    o.extend(d.prototype, s, {
        changed: null,
        validationError: null,
        idAttribute: "id",
        initialize: function() {},
        toJSON: function() {
            return o.clone(this.attributes)
        },
        sync: function() {
            return e.sync.apply(this, arguments)
        },
        get: function(e) {
            return this.attributes[e]
        },
        escape: function(e) {
            return o.escape(this.get(e))
        },
        has: function(e) {
            return null != this.get(e)
        },
        set: function(e, t, n) {
            var i, r, s, a, u, l, c, d;
            if (null == e) return this;
            if ("object" == typeof e ? (r = e, n = t) : (r = {})[e] = t, n || (n = {}), !this._validate(r, n)) return ! 1;
            s = n.unset,
            u = n.silent,
            a = [],
            l = this._changing,
            this._changing = !0,
            l || (this._previousAttributes = o.clone(this.attributes), this.changed = {}),
            d = this.attributes,
            c = this._previousAttributes,
            this.idAttribute in r && (this.id = r[this.idAttribute]);
            for (i in r) t = r[i],
            o.isEqual(d[i], t) || a.push(i),
            o.isEqual(c[i], t) ? delete this.changed[i] : this.changed[i] = t,
            s ? delete d[i] : d[i] = t;
            if (!u) {
                a.length && (this._pending = !0);
                for (var h = 0,
                f = a.length; f > h; h++) this.trigger("change:" + a[h], this, d[a[h]], n)
            }
            if (l) return this;
            if (!u) for (; this._pending;) this._pending = !1,
            this.trigger("change", this, n);
            return this._pending = !1,
            this._changing = !1,
            this
        },
        unset: function(e, t) {
            return this.set(e, void 0, o.extend({},
            t, {
                unset: !0
            }))
        },
        clear: function(e) {
            var t = {};
            for (var n in this.attributes) t[n] = void 0;
            return this.set(t, o.extend({},
            e, {
                unset: !0
            }))
        },
        hasChanged: function(e) {
            return null == e ? !o.isEmpty(this.changed) : o.has(this.changed, e)
        },
        changedAttributes: function(e) {
            if (!e) return this.hasChanged() ? o.clone(this.changed) : !1;
            var t, n = !1,
            i = this._changing ? this._previousAttributes: this.attributes;
            for (var r in e) o.isEqual(i[r], t = e[r]) || ((n || (n = {}))[r] = t);
            return n
        },
        previous: function(e) {
            return null != e && this._previousAttributes ? this._previousAttributes[e] : null
        },
        previousAttributes: function() {
            return o.clone(this._previousAttributes)
        },
        fetch: function(e) {
            e = e ? o.clone(e) : {},
            void 0 === e.parse && (e.parse = !0);
            var t = this,
            n = e.success;
            return e.success = function(i) {
                return t.set(t.parse(i, e), e) ? (n && n(t, i, e), void t.trigger("sync", t, i, e)) : !1
            },
            q(this, e),
            this.sync("read", this, e)
        },
        save: function(e, t, n) {
            var i, r, s, a = this.attributes;
            if (null == e || "object" == typeof e ? (i = e, n = t) : (i = {})[e] = t, n = o.extend({
                validate: !0
            },
            n), i && !n.wait) {
                if (!this.set(i, n)) return ! 1
            } else if (!this._validate(i, n)) return ! 1;
            i && n.wait && (this.attributes = o.extend({},
            a, i)),
            void 0 === n.parse && (n.parse = !0);
            var u = this,
            l = n.success;
            return n.success = function(e) {
                u.attributes = a;
                var t = u.parse(e, n);
                return n.wait && (t = o.extend(i || {},
                t)),
                o.isObject(t) && !u.set(t, n) ? !1 : (l && l(u, e, n), void u.trigger("sync", u, e, n))
            },
            q(this, n),
            r = this.isNew() ? "create": n.patch ? "patch": "update",
            "patch" === r && (n.attrs = i),
            s = this.sync(r, this, n),
            i && n.wait && (this.attributes = a),
            s
        },
        destroy: function(e) {
            e = e ? o.clone(e) : {};
            var t = this,
            n = e.success,
            i = function() {
                t.trigger("destroy", t, t.collection, e)
            };
            if (e.success = function(r) { (e.wait || t.isNew()) && i(),
                n && n(t, r, e),
                t.isNew() || t.trigger("sync", t, r, e)
            },
            this.isNew()) return e.success(),
            !1;
            q(this, e);
            var r = this.sync("delete", this, e);
            return e.wait || i(),
            r
        },
        url: function() {
            var e = o.result(this, "urlRoot") || o.result(this.collection, "url") || L();
            return this.isNew() ? e: e + ("/" === e.charAt(e.length - 1) ? "": "/") + encodeURIComponent(this.id)
        },
        parse: function(e) {
            return e
        },
        clone: function() {
            return new this.constructor(this.attributes)
        },
        isNew: function() {
            return null == this.id
        },
        isValid: function(e) {
            return this._validate({},
            o.extend(e || {},
            {
                validate: !0
            }))
        },
        _validate: function(e, t) {
            if (!t.validate || !this.validate) return ! 0;
            e = o.extend({},
            this.attributes, e);
            var n = this.validationError = this.validate(e, t) || null;
            return n ? (this.trigger("invalid", this, n, o.extend(t, {
                validationError: n
            })), !1) : !0
        }
    });
    var h = ["keys", "values", "pairs", "invert", "pick", "omit"];
    o.each(h,
    function(e) {
        d.prototype[e] = function() {
            var t = r.call(arguments);
            return t.unshift(this.attributes),
            o[e].apply(o, t)
        }
    });
    var f = e.Collection = function(e, t) {
        t || (t = {}),
        t.model && (this.model = t.model),
        void 0 !== t.comparator && (this.comparator = t.comparator),
        this._reset(),
        this.initialize.apply(this, arguments),
        e && this.reset(e, o.extend({
            silent: !0
        },
        t))
    },
    p = {
        add: !0,
        remove: !0,
        merge: !0
    },
    g = {
        add: !0,
        remove: !1
    };
    o.extend(f.prototype, s, {
        model: d,
        initialize: function() {},
        toJSON: function(e) {
            return this.map(function(t) {
                return t.toJSON(e)
            })
        },
        sync: function() {
            return e.sync.apply(this, arguments)
        },
        add: function(e, t) {
            return this.set(e, o.extend({
                merge: !1
            },
            t, g))
        },
        remove: function(e, t) {
            var n = !o.isArray(e);
            e = n ? [e] : o.clone(e),
            t || (t = {});
            var i, r, s, a;
            for (i = 0, r = e.length; r > i; i++) a = e[i] = this.get(e[i]),
            a && (delete this._byId[a.id], delete this._byId[a.cid], s = this.indexOf(a), this.models.splice(s, 1), this.length--, t.silent || (t.index = s, a.trigger("remove", a, this, t)), this._removeReference(a));
            return n ? e[0] : e
        },
        set: function(e, t) {
            t = o.defaults({},
            t, p),
            t.parse && (e = this.parse(e, t));
            var n = !o.isArray(e);
            e = n ? e ? [e] : [] : o.clone(e);
            var i, r, s, a, u, l, c, h = t.at,
            f = this.model,
            g = this.comparator && null == h && t.sort !== !1,
            m = o.isString(this.comparator) ? this.comparator: null,
            v = [],
            y = [],
            b = {},
            x = t.add,
            w = t.merge,
            C = t.remove,
            _ = !g && x && C ? [] : !1;
            for (i = 0, r = e.length; r > i; i++) {
                if (u = e[i], s = u instanceof d ? a = u: u[f.prototype.idAttribute], l = this.get(s)) C && (b[l.cid] = !0),
                w && (u = u === a ? a.attributes: u, t.parse && (u = l.parse(u, t)), l.set(u, t), g && !c && l.hasChanged(m) && (c = !0)),
                e[i] = l;
                else if (x) {
                    if (a = e[i] = this._prepareModel(u, t), !a) continue;
                    v.push(a),
                    a.on("all", this._onModelEvent, this),
                    this._byId[a.cid] = a,
                    null != a.id && (this._byId[a.id] = a)
                }
                _ && _.push(l || a)
            }
            if (C) {
                for (i = 0, r = this.length; r > i; ++i) b[(a = this.models[i]).cid] || y.push(a);
                y.length && this.remove(y, t)
            }
            if (v.length || _ && _.length) if (g && (c = !0), this.length += v.length, null != h) for (i = 0, r = v.length; r > i; i++) this.models.splice(h + i, 0, v[i]);
            else {
                _ && (this.models.length = 0);
                var E = _ || v;
                for (i = 0, r = E.length; r > i; i++) this.models.push(E[i])
            }
            if (c && this.sort({
                silent: !0
            }), !t.silent) {
                for (i = 0, r = v.length; r > i; i++)(a = v[i]).trigger("add", a, this, t); (c || _ && _.length) && this.trigger("sort", this, t)
            }
            return n ? e[0] : e
        },
        reset: function(e, t) {
            t || (t = {});
            for (var n = 0,
            i = this.models.length; i > n; n++) this._removeReference(this.models[n]);
            return t.previousModels = this.models,
            this._reset(),
            e = this.add(e, o.extend({
                silent: !0
            },
            t)),
            t.silent || this.trigger("reset", this, t),
            e
        },
        push: function(e, t) {
            return this.add(e, o.extend({
                at: this.length
            },
            t))
        },
        pop: function(e) {
            var t = this.at(this.length - 1);
            return this.remove(t, e),
            t
        },
        unshift: function(e, t) {
            return this.add(e, o.extend({
                at: 0
            },
            t))
        },
        shift: function(e) {
            var t = this.at(0);
            return this.remove(t, e),
            t
        },
        slice: function() {
            return r.apply(this.models, arguments)
        },
        get: function(e) {
            return null == e ? void 0 : this._byId[e.id] || this._byId[e.cid] || this._byId[e]
        },
        at: function(e) {
            return this.models[e]
        },
        where: function(e, t) {
            return o.isEmpty(e) ? t ? void 0 : [] : this[t ? "find": "filter"](function(t) {
                for (var n in e) if (e[n] !== t.get(n)) return ! 1;
                return ! 0
            })
        },
        findWhere: function(e) {
            return this.where(e, !0)
        },
        sort: function(e) {
            if (!this.comparator) throw new Error("Cannot sort a set without a comparator");
            return e || (e = {}),
            o.isString(this.comparator) || 1 === this.comparator.length ? this.models = this.sortBy(this.comparator, this) : this.models.sort(o.bind(this.comparator, this)),
            e.silent || this.trigger("sort", this, e),
            this
        },
        pluck: function(e) {
            return o.invoke(this.models, "get", e)
        },
        fetch: function(e) {
            e = e ? o.clone(e) : {},
            void 0 === e.parse && (e.parse = !0);
            var t = e.success,
            n = this;
            return e.success = function(i) {
                var r = e.reset ? "reset": "set";
                n[r](i, e),
                t && t(n, i, e),
                n.trigger("sync", n, i, e)
            },
            q(this, e),
            this.sync("read", this, e)
        },
        create: function(e, t) {
            if (t = t ? o.clone(t) : {},
            !(e = this._prepareModel(e, t))) return ! 1;
            t.wait || this.add(e, t);
            var n = this,
            i = t.success;
            return t.success = function(e, t, r) {
                r.wait && n.add(e, r),
                i && i(e, t, r)
            },
            e.save(null, t),
            e
        },
        parse: function(e) {
            return e
        },
        clone: function() {
            return new this.constructor(this.models)
        },
        _reset: function() {
            this.length = 0,
            this.models = [],
            this._byId = {}
        },
        _prepareModel: function(e, t) {
            if (e instanceof d) return e.collection || (e.collection = this),
            e;
            t = t ? o.clone(t) : {},
            t.collection = this;
            var n = new this.model(e, t);
            return n.validationError ? (this.trigger("invalid", this, n.validationError, t), !1) : n
        },
        _removeReference: function(e) {
            this === e.collection && delete e.collection,
            e.off("all", this._onModelEvent, this)
        },
        _onModelEvent: function(e, t, n, i) { ("add" !== e && "remove" !== e || n === this) && ("destroy" === e && this.remove(t, i), t && e === "change:" + t.idAttribute && (delete this._byId[t.previous(t.idAttribute)], null != t.id && (this._byId[t.id] = t)), this.trigger.apply(this, arguments))
        }
    });
    var m = ["forEach", "each", "map", "collect", "reduce", "foldl", "inject", "reduceRight", "foldr", "find", "detect", "filter", "select", "reject", "every", "all", "some", "any", "include", "contains", "invoke", "max", "min", "toArray", "size", "first", "head", "take", "initial", "rest", "tail", "drop", "last", "without", "difference", "indexOf", "shuffle", "lastIndexOf", "isEmpty", "chain"];
    o.each(m,
    function(e) {
        f.prototype[e] = function() {
            var t = r.call(arguments);
            return t.unshift(this.models),
            o[e].apply(o, t)
        }
    });
    var v = ["groupBy", "countBy", "sortBy"];
    o.each(v,
    function(e) {
        f.prototype[e] = function(t, n) {
            var i = o.isFunction(t) ? t: function(e) {
                return e.get(t)
            };
            return o[e](this.models, i, n)
        }
    });
    var y = e.View = function(e) {
        this.cid = o.uniqueId("view"),
        e || (e = {}),
        o.extend(this, o.pick(e, x)),
        this._ensureElement(),
        this.initialize.apply(this, arguments),
        this.delegateEvents()
    },
    b = /^(\S+)\s*(.*)$/,
    x = ["model", "collection", "el", "id", "attributes", "className", "tagName", "events"];
    o.extend(y.prototype, s, {
        tagName: "div",
        $: function(e) {
            return this.$el.find(e)
        },
        initialize: function() {},
        render: function() {
            return this
        },
        remove: function() {
            return this.$el.remove(),
            this.stopListening(),
            this
        },
        setElement: function(t, n) {
            return this.$el && this.undelegateEvents(),
            this.$el = t instanceof e.$ ? t: e.$(t),
            this.el = this.$el[0],
            n !== !1 && this.delegateEvents(),
            this
        },
        delegateEvents: function(e) {
            if (!e && !(e = o.result(this, "events"))) return this;
            this.undelegateEvents();
            for (var t in e) {
                var n = e[t];
                if (o.isFunction(n) || (n = this[e[t]]), n) {
                    var i = t.match(b),
                    r = i[1],
                    s = i[2];
                    n = o.bind(n, this),
                    r += ".delegateEvents" + this.cid,
                    "" === s ? this.$el.on(r, n) : this.$el.on(r, s, n)
                }
            }
            return this
        },
        undelegateEvents: function() {
            return this.$el.off(".delegateEvents" + this.cid),
            this
        },
        _ensureElement: function() {
            if (this.el) this.setElement(o.result(this, "el"), !1);
            else {
                var t = o.extend({},
                o.result(this, "attributes"));
                this.id && (t.id = o.result(this, "id")),
                this.className && (t["class"] = o.result(this, "className"));
                var n = e.$("<" + o.result(this, "tagName") + ">").attr(t);
                this.setElement(n, !1)
            }
        }
    }),
    e.sync = function(t, n, i) {
        var r = C[t];
        o.defaults(i || (i = {}), {
            emulateHTTP: e.emulateHTTP,
            emulateJSON: e.emulateJSON
        });
        var s = {
            type: r,
            dataType: "json"
        };
        if (i.url || (s.url = o.result(n, "url") || L()), null != i.data || !n || "create" !== t && "update" !== t && "patch" !== t || (s.contentType = "application/json", s.data = JSON.stringify(i.attrs || n.toJSON(i))), i.emulateJSON && (s.contentType = "application/x-www-form-urlencoded", s.data = s.data ? {
            model: s.data
        }: {}), i.emulateHTTP && ("PUT" === r || "DELETE" === r || "PATCH" === r)) {
            s.type = "POST",
            i.emulateJSON && (s.data._method = r);
            var a = i.beforeSend;
            i.beforeSend = function(e) {
                return e.setRequestHeader("X-HTTP-Method-Override", r),
                a ? a.apply(this, arguments) : void 0
            }
        }
        "GET" === s.type || i.emulateJSON || (s.processData = !1),
        "PATCH" === s.type && w && (s.xhr = function() {
            return new ActiveXObject("Microsoft.XMLHTTP")
        });
        var u = i.xhr = e.ajax(o.extend(s, i));
        return n.trigger("request", n, u, i),
        u
    };
    var w = !("undefined" == typeof window || !window.ActiveXObject || window.XMLHttpRequest && (new XMLHttpRequest).dispatchEvent),
    C = {
        create: "POST",
        update: "PUT",
        patch: "PATCH",
        "delete": "DELETE",
        read: "GET"
    };
    e.ajax = function() {
        return e.$.ajax.apply(e.$, arguments)
    };
    var _ = e.Router = function(e) {
        e || (e = {}),
        e.routes && (this.routes = e.routes),
        this._bindRoutes(),
        this.initialize.apply(this, arguments)
    },
    E = /\((.*?)\)/g,
    F = /(\(\?)?:\w+/g,
    T = /\*\w+/g,
    k = /[\-{}\[\]+?.,\\\^$|#\s]/g;
    o.extend(_.prototype, s, {
        initialize: function() {},
        route: function(t, n, i) {
            o.isRegExp(t) || (t = this._routeToRegExp(t)),
            o.isFunction(n) && (i = n, n = ""),
            i || (i = this[n]);
            var r = this;
            return e.history.route(t,
            function(o) {
                var s = r._extractParameters(t, o);
                i && i.apply(r, s),
                r.trigger.apply(r, ["route:" + n].concat(s)),
                r.trigger("route", n, s),
                e.history.trigger("route", r, n, s)
            }),
            this
        },
        navigate: function(t, n) {
            return e.history.navigate(t, n),
            this
        },
        _bindRoutes: function() {
            if (this.routes) {
                this.routes = o.result(this, "routes");
                for (var e, t = o.keys(this.routes); null != (e = t.pop());) this.route(e, this.routes[e])
            }
        },
        _routeToRegExp: function(e) {
            return e = e.replace(k, "\\$&").replace(E, "(?:$1)?").replace(F,
            function(e, t) {
                return t ? e: "([^/]+)"
            }).replace(T, "(.*?)"),
            new RegExp("^" + e + "$")
        },
        _extractParameters: function(e, t) {
            var n = e.exec(t).slice(1);
            return o.map(n,
            function(e) {
                return e ? decodeURIComponent(e) : null
            })
        }
    });
    var S = e.History = function() {
        this.handlers = [],
        o.bindAll(this, "checkUrl"),
        "undefined" != typeof window && (this.location = window.location, this.history = window.history)
    },
    N = /^[#\/]|\s+$/g,
    j = /^\/+|\/+$/g,
    A = /msie [\w.]+/,
    D = /\/$/,
    M = /[?#].*$/;
    S.started = !1,
    o.extend(S.prototype, s, {
        interval: 50,
        getHash: function(e) {
            var t = (e || this).location.href.match(/#(.*)$/);
            return t ? t[1] : ""
        },
        getFragment: function(e, t) {
            if (null == e) if (this._hasPushState || !this._wantsHashChange || t) {
                e = this.location.pathname;
                var n = this.root.replace(D, "");
                e.indexOf(n) || (e = e.slice(n.length))
            } else e = this.getHash();
            return e.replace(N, "")
        },
        start: function(t) {
            if (S.started) throw new Error("Backbone.history has already been started");
            S.started = !0,
            this.options = o.extend({
                root: "/"
            },
            this.options, t),
            this.root = this.options.root,
            this._wantsHashChange = this.options.hashChange !== !1,
            this._wantsPushState = !!this.options.pushState,
            this._hasPushState = !!(this.options.pushState && this.history && this.history.pushState);
            var n = this.getFragment(),
            i = document.documentMode,
            r = A.exec(navigator.userAgent.toLowerCase()) && (!i || 7 >= i);
            this.root = ("/" + this.root + "/").replace(j, "/"),
            r && this._wantsHashChange && (this.iframe = e.$('<iframe src="javascript:0" tabindex="-1" />').hide().appendTo("body")[0].contentWindow, this.navigate(n)),
            this._hasPushState ? e.$(window).on("popstate", this.checkUrl) : this._wantsHashChange && "onhashchange" in window && !r ? e.$(window).on("hashchange", this.checkUrl) : this._wantsHashChange && (this._checkUrlInterval = setInterval(this.checkUrl, this.interval)),
            this.fragment = n;
            var s = this.location,
            a = s.pathname.replace(/[^\/]$/, "$&/") === this.root;
            if (this._wantsHashChange && this._wantsPushState) {
                if (!this._hasPushState && !a) return this.fragment = this.getFragment(null, !0),
                this.location.replace(this.root + this.location.search + "#" + this.fragment),
                !0;
                this._hasPushState && a && s.hash && (this.fragment = this.getHash().replace(N, ""), this.history.replaceState({},
                document.title, this.root + this.fragment + s.search))
            }
            return this.options.silent ? void 0 : this.loadUrl()
        },
        stop: function() {
            e.$(window).off("popstate", this.checkUrl).off("hashchange", this.checkUrl),
            clearInterval(this._checkUrlInterval),
            S.started = !1
        },
        route: function(e, t) {
            this.handlers.unshift({
                route: e,
                callback: t
            })
        },
        checkUrl: function() {
            var e = this.getFragment();
            return e === this.fragment && this.iframe && (e = this.getFragment(this.getHash(this.iframe))),
            e === this.fragment ? !1 : (this.iframe && this.navigate(e), void this.loadUrl())
        },
        loadUrl: function(e) {
            return e = this.fragment = this.getFragment(e),
            o.any(this.handlers,
            function(t) {
                return t.route.test(e) ? (t.callback(e), !0) : void 0
            })
        },
        navigate: function(e, t) {
            if (!S.started) return ! 1;
            t && t !== !0 || (t = {
                trigger: !!t
            });
            var n = this.root + (e = this.getFragment(e || ""));
            if (e = e.replace(M, ""), this.fragment !== e) {
                if (this.fragment = e, "" === e && "/" !== n && (n = n.slice(0, -1)), this._hasPushState) this.history[t.replace ? "replaceState": "pushState"]({},
                document.title, n);
                else {
                    if (!this._wantsHashChange) return this.location.assign(n);
                    this._updateHash(this.location, e, t.replace),
                    this.iframe && e !== this.getFragment(this.getHash(this.iframe)) && (t.replace || this.iframe.document.open().close(), this._updateHash(this.iframe.location, e, t.replace))
                }
                return t.trigger ? this.loadUrl(e) : void 0
            }
        },
        _updateHash: function(e, t, n) {
            if (n) {
                var i = e.href.replace(/(javascript:|#).*$/, "");
                e.replace(i + "#" + t)
            } else e.hash = "#" + t
        }
    }),
    e.history = new S;
    var R = function(e, t) {
        var n, i = this;
        n = e && o.has(e, "constructor") ? e.constructor: function() {
            return i.apply(this, arguments)
        },
        o.extend(n, i, t);
        var r = function() {
            this.constructor = n
        };
        return r.prototype = i.prototype,
        n.prototype = new r,
        e && o.extend(n.prototype, e),
        n.__super__ = i.prototype,
        n
    };
    d.extend = f.extend = _.extend = y.extend = S.extend = R;
    var L = function() {
        throw new Error('A "url" property or function must be specified')
    },
    q = function(e, t) {
        var n = t.error;
        t.error = function(i) {
            n && n(e, i, t),
            e.trigger("error", e, i, t)
        }
    }
}.call(this),
define("backbone", ["jquery", "underscore"],
function(e) {
    return function() {
        var t;
        return t || e.Backbone
    }
} (this)),
Backbone.ChildViewContainer = function(e, t) {
    var n = function(e) {
        this._views = {},
        this._indexByModel = {},
        this._indexByCustom = {},
        this._updateLength(),
        t.each(e, this.add, this)
    };
    t.extend(n.prototype, {
        add: function(e, t) {
            var n = e.cid;
            return this._views[n] = e,
            e.model && (this._indexByModel[e.model.cid] = n),
            t && (this._indexByCustom[t] = n),
            this._updateLength(),
            this
        },
        findByModel: function(e) {
            return this.findByModelCid(e.cid)
        },
        findByModelCid: function(e) {
            var t = this._indexByModel[e];
            return this.findByCid(t)
        },
        findByCustom: function(e) {
            var t = this._indexByCustom[e];
            return this.findByCid(t)
        },
        findByIndex: function(e) {
            return t.values(this._views)[e]
        },
        findByCid: function(e) {
            return this._views[e]
        },
        remove: function(e) {
            var n = e.cid;
            return e.model && delete this._indexByModel[e.model.cid],
            t.any(this._indexByCustom,
            function(e, t) {
                return e === n ? (delete this._indexByCustom[t], !0) : void 0
            },
            this),
            delete this._views[n],
            this._updateLength(),
            this
        },
        call: function(e) {
            this.apply(e, t.tail(arguments))
        },
        apply: function(e, n) {
            t.each(this._views,
            function(i) {
                t.isFunction(i[e]) && i[e].apply(i, n || [])
            })
        },
        _updateLength: function() {
            this.length = t.size(this._views)
        }
    });
    var i = ["forEach", "each", "map", "find", "detect", "filter", "select", "reject", "every", "all", "some", "any", "include", "contains", "invoke", "toArray", "first", "initial", "rest", "last", "without", "isEmpty", "pluck"];
    return t.each(i,
    function(e) {
        n.prototype[e] = function() {
            var n = t.values(this._views),
            i = [n].concat(t.toArray(arguments));
            return t[e].apply(t, i)
        }
    }),
    n
} (Backbone, _),
Backbone.Wreqr = function(e, t, n) {
    var i = {};
    return i.Handlers = function(e, t) {
        var n = function(e) {
            this.options = e,
            this._wreqrHandlers = {},
            t.isFunction(this.initialize) && this.initialize(e)
        };
        return n.extend = e.Model.extend,
        t.extend(n.prototype, e.Events, {
            setHandlers: function(e) {
                t.each(e,
                function(e, n) {
                    var i = null;
                    t.isObject(e) && !t.isFunction(e) && (i = e.context, e = e.callback),
                    this.setHandler(n, e, i)
                },
                this)
            },
            setHandler: function(e, t, n) {
                var i = {
                    callback: t,
                    context: n
                };
                this._wreqrHandlers[e] = i,
                this.trigger("handler:add", e, t, n)
            },
            hasHandler: function(e) {
                return !! this._wreqrHandlers[e]
            },
            getHandler: function(e) {
                var t = this._wreqrHandlers[e];
                if (!t) throw new Error("Handler not found for '" + e + "'");
                return function() {
                    var e = Array.prototype.slice.apply(arguments);
                    return t.callback.apply(t.context, e)
                }
            },
            removeHandler: function(e) {
                delete this._wreqrHandlers[e]
            },
            removeAllHandlers: function() {
                this._wreqrHandlers = {}
            }
        }),
        n
    } (e, n),
    i.CommandStorage = function() {
        var t = function(e) {
            this.options = e,
            this._commands = {},
            n.isFunction(this.initialize) && this.initialize(e)
        };
        return n.extend(t.prototype, e.Events, {
            getCommands: function(e) {
                var t = this._commands[e];
                return t || (t = {
                    command: e,
                    instances: []
                },
                this._commands[e] = t),
                t
            },
            addCommand: function(e, t) {
                var n = this.getCommands(e);
                n.instances.push(t)
            },
            clearCommands: function(e) {
                var t = this.getCommands(e);
                t.instances = []
            }
        }),
        t
    } (),
    i.Commands = function(e) {
        return e.Handlers.extend({
            storageType: e.CommandStorage,
            constructor: function(t) {
                this.options = t || {},
                this._initializeStorage(this.options),
                this.on("handler:add", this._executeCommands, this);
                var n = Array.prototype.slice.call(arguments);
                e.Handlers.prototype.constructor.apply(this, n)
            },
            execute: function(e, t) {
                e = arguments[0],
                t = Array.prototype.slice.call(arguments, 1),
                this.hasHandler(e) ? this.getHandler(e).apply(this, t) : this.storage.addCommand(e, t)
            },
            _executeCommands: function(e, t, i) {
                var r = this.storage.getCommands(e);
                n.each(r.instances,
                function(e) {
                    t.apply(i, e)
                }),
                this.storage.clearCommands(e)
            },
            _initializeStorage: function(e) {
                var t, i = e.storageType || this.storageType;
                t = n.isFunction(i) ? new i: i,
                this.storage = t
            }
        })
    } (i),
    i.RequestResponse = function(e) {
        return e.Handlers.extend({
            request: function() {
                var e = arguments[0],
                t = Array.prototype.slice.call(arguments, 1);
                return this.getHandler(e).apply(this, t)
            }
        })
    } (i),
    i.EventAggregator = function(e, t) {
        var n = function() {};
        return n.extend = e.Model.extend,
        t.extend(n.prototype, e.Events),
        n
    } (e, n),
    i
} (Backbone, Backbone.Marionette, _);
var Marionette = function(e, t, n) {
    function i(e, t) {
        var n = new Error(e);
        throw n.name = t || "Error",
        n
    }
    var r = {};
    t.Marionette = r,
    r.$ = t.$;
    var o = Array.prototype.slice;
    return r.extend = t.Model.extend,
    r.getOption = function(e, t) {
        if (e && t) {
            var n;
            return n = e.options && t in e.options && void 0 !== e.options[t] ? e.options[t] : e[t]
        }
    },
    r.normalizeMethods = function(e) {
        var t, i = {};
        return n.each(e,
        function(e, r) {
            t = e,
            n.isFunction(t) || (t = this[t]),
            t && (i[r] = t)
        },
        this),
        i
    },
    r.triggerMethod = function() {
        function e(e, t, n) {
            return n.toUpperCase()
        }
        var t = /(^|:)(\w)/gi,
        i = function(i) {
            var r = "on" + i.replace(t, e),
            o = this[r];
            return n.isFunction(this.trigger) && this.trigger.apply(this, arguments),
            n.isFunction(o) ? o.apply(this, n.tail(arguments)) : void 0
        };
        return i
    } (),
    r.MonitorDOMRefresh = function(e) {
        function t(e) {
            e._isShown = !0,
            r(e)
        }
        function i(e) {
            e._isRendered = !0,
            r(e)
        }
        function r(e) {
            e._isShown && e._isRendered && o(e) && n.isFunction(e.triggerMethod) && e.triggerMethod("dom:refresh")
        }
        function o(t) {
            return e.contains(t.el)
        }
        return function(e) {
            e.listenTo(e, "show",
            function() {
                t(e)
            }),
            e.listenTo(e, "render",
            function() {
                i(e)
            })
        }
    } (document.documentElement),
    function(e) {
        function t(e, t, r, o) {
            var s = o.split(/\s+/);
            n.each(s,
            function(n) {
                var o = e[n];
                o || i("Method '" + n + "' was configured as an event handler, but does not exist."),
                e.listenTo(t, r, o)
            })
        }
        function r(e, t, n, i) {
            e.listenTo(t, n, i)
        }
        function o(e, t, i, r) {
            var o = r.split(/\s+/);
            n.each(o,
            function(n) {
                var r = e[n];
                e.stopListening(t, i, r)
            })
        }
        function s(e, t, n, i) {
            e.stopListening(t, n, i)
        }
        function a(e, t, i, r, o) {
            t && i && (n.isFunction(i) && (i = i.call(e)), n.each(i,
            function(i, s) {
                n.isFunction(i) ? r(e, t, s, i) : o(e, t, s, i)
            }))
        }
        e.bindEntityEvents = function(e, n, i) {
            a(e, n, i, r, t)
        },
        e.unbindEntityEvents = function(e, t, n) {
            a(e, t, n, s, o)
        }
    } (r),
    r.Callbacks = function() {
        this._deferred = r.$.Deferred(),
        this._callbacks = []
    },
    n.extend(r.Callbacks.prototype, {
        add: function(e, t) {
            this._callbacks.push({
                cb: e,
                ctx: t
            }),
            this._deferred.done(function(n, i) {
                t && (n = t),
                e.call(n, i)
            })
        },
        run: function(e, t) {
            this._deferred.resolve(t, e)
        },
        reset: function() {
            var e = this._callbacks;
            this._deferred = r.$.Deferred(),
            this._callbacks = [],
            n.each(e,
            function(e) {
                this.add(e.cb, e.ctx)
            },
            this)
        }
    }),
    r.Controller = function(e) {
        this.triggerMethod = r.triggerMethod,
        this.options = e || {},
        n.isFunction(this.initialize) && this.initialize(this.options)
    },
    r.Controller.extend = r.extend,
    n.extend(r.Controller.prototype, t.Events, {
        close: function() {
            this.stopListening(),
            this.triggerMethod("close"),
            this.unbind()
        }
    }),
    r.Region = function(e) {
        if (this.options = e || {},
        this.el = r.getOption(this, "el"), this.el || i("An 'el' must be specified for a region.", "NoElError"), this.initialize) {
            var t = Array.prototype.slice.apply(arguments);
            this.initialize.apply(this, t)
        }
    },
    n.extend(r.Region, {
        buildRegion: function(e, t) {
            var r = n.isString(e),
            o = n.isString(e.selector),
            s = n.isUndefined(e.regionType),
            a = n.isFunction(e);
            a || r || o || i("Region must be specified as a Region type, a selector string or an object with selector property");
            var u, l;
            r && (u = e),
            e.selector && (u = e.selector, delete e.selector),
            a && (l = e),
            !a && s && (l = t),
            e.regionType && (l = e.regionType, delete e.regionType),
            (r || a) && (e = {}),
            e.el = u;
            var c = new l(e);
            return e.parentEl && (c.getEl = function(t) {
                var i = e.parentEl;
                return n.isFunction(i) && (i = i()),
                i.find(t)
            }),
            c
        }
    }),
    n.extend(r.Region.prototype, t.Events, {
        show: function(e) {
            this.ensureEl();
            var t = e.isClosed || n.isUndefined(e.$el),
            i = e !== this.currentView;
            i && this.close(),
            e.render(),
            (i || t) && this.open(e),
            this.currentView = e,
            r.triggerMethod.call(this, "show", e),
            r.triggerMethod.call(e, "show")
        },
        ensureEl: function() {
            this.$el && 0 !== this.$el.length || (this.$el = this.getEl(this.el))
        },
        getEl: function(e) {
            return r.$(e)
        },
        open: function(e) {
            this.$el.empty().append(e.el)
        },
        close: function() {
            var e = this.currentView;
            e && !e.isClosed && (e.close ? e.close() : e.remove && e.remove(), r.triggerMethod.call(this, "close", e), delete this.currentView)
        },
        attachView: function(e) {
            this.currentView = e
        },
        reset: function() {
            this.close(),
            delete this.$el
        }
    }),
    r.Region.extend = r.extend,
    r.RegionManager = function(e) {
        var t = e.Controller.extend({
            constructor: function(t) {
                this._regions = {},
                e.Controller.prototype.constructor.call(this, t)
            },
            addRegions: function(e, t) {
                var i = {};
                return n.each(e,
                function(e, r) {
                    n.isString(e) && (e = {
                        selector: e
                    }),
                    e.selector && (e = n.defaults({},
                    e, t));
                    var o = this.addRegion(r, e);
                    i[r] = o
                },
                this),
                i
            },
            addRegion: function(t, i) {
                var r, o = n.isObject(i),
                s = n.isString(i),
                a = !!i.selector;
                return r = s || o && a ? e.Region.buildRegion(i, e.Region) : n.isFunction(i) ? e.Region.buildRegion(i, e.Region) : i,
                this._store(t, r),
                this.triggerMethod("region:add", t, r),
                r
            },
            get: function(e) {
                return this._regions[e]
            },
            removeRegion: function(e) {
                var t = this._regions[e];
                this._remove(e, t)
            },
            removeRegions: function() {
                n.each(this._regions,
                function(e, t) {
                    this._remove(t, e)
                },
                this)
            },
            closeRegions: function() {
                n.each(this._regions,
                function(e) {
                    e.close()
                },
                this)
            },
            close: function() {
                this.removeRegions(),
                e.Controller.prototype.close.apply(this, arguments)
            },
            _store: function(e, t) {
                this._regions[e] = t,
                this._setLength()
            },
            _remove: function(e, t) {
                t.close(),
                delete this._regions[e],
                this._setLength(),
                this.triggerMethod("region:remove", e, t)
            },
            _setLength: function() {
                this.length = n.size(this._regions)
            }
        }),
        i = ["forEach", "each", "map", "find", "detect", "filter", "select", "reject", "every", "all", "some", "any", "include", "contains", "invoke", "toArray", "first", "initial", "rest", "last", "without", "isEmpty", "pluck"];
        return n.each(i,
        function(e) {
            t.prototype[e] = function() {
                var t = n.values(this._regions),
                i = [t].concat(n.toArray(arguments));
                return n[e].apply(n, i)
            }
        }),
        t
    } (r),
    r.TemplateCache = function(e) {
        this.templateId = e
    },
    n.extend(r.TemplateCache, {
        templateCaches: {},
        get: function(e) {
            var t = this.templateCaches[e];
            return t || (t = new r.TemplateCache(e), this.templateCaches[e] = t),
            t.load()
        },
        clear: function() {
            var e, t = o.call(arguments),
            n = t.length;
            if (n > 0) for (e = 0; n > e; e++) delete this.templateCaches[t[e]];
            else this.templateCaches = {}
        }
    }),
    n.extend(r.TemplateCache.prototype, {
        load: function() {
            if (this.compiledTemplate) return this.compiledTemplate;
            var e = this.loadTemplate(this.templateId);
            return this.compiledTemplate = this.compileTemplate(e),
            this.compiledTemplate
        },
        loadTemplate: function(e) {
            var t = r.$(e).html();
            return t && 0 !== t.length || i("Could not find template: '" + e + "'", "NoTemplateError"),
            t
        },
        compileTemplate: function(e) {
            return n.template(e)
        }
    }),
    r.Renderer = {
        render: function(e, t) {
            e || i("Cannot render the template since it's false, null or undefined.", "TemplateNotFoundError");
            var n;
            return (n = "function" == typeof e ? e: r.TemplateCache.get(e))(t)
        }
    },
    r.View = t.View.extend({
        constructor: function(e) {
            n.bindAll(this, "render"),
            this.options = n.extend({},
            n.result(this, "options"), n.isFunction(e) ? e.call(this) : e),
            this.events = this.normalizeUIKeys(n.result(this, "events")),
            t.View.prototype.constructor.apply(this, arguments),
            r.MonitorDOMRefresh(this),
            this.listenTo(this, "show", this.onShowCalled)
        },
        triggerMethod: r.triggerMethod,
        normalizeMethods: r.normalizeMethods,
        getTemplate: function() {
            return r.getOption(this, "template")
        },
        mixinTemplateHelpers: function(e) {
            e = e || {};
            var t = r.getOption(this, "templateHelpers");
            return n.isFunction(t) && (t = t.call(this)),
            n.extend(e, t)
        },
        normalizeUIKeys: function(e) {
            var t = this;
            if ("undefined" != typeof e) return n.each(n.keys(e),
            function(i) {
                var r = /@ui.[a-zA-Z_$0-9]*/g;
                i.match(r) && (e[i.replace(r,
                function(e) {
                    return n.result(t, "ui")[e.slice(4)]
                })] = e[i], delete e[i])
            }),
            e
        },
        configureTriggers: function() {
            if (this.triggers) {
                var e = {},
                t = this.normalizeUIKeys(n.result(this, "triggers"));
                return n.each(t,
                function(t, i) {
                    var r = n.isObject(t),
                    o = r ? t.event: t;
                    e[i] = function(e) {
                        if (e) {
                            var n = e.preventDefault,
                            i = e.stopPropagation,
                            s = r ? t.preventDefault: n,
                            a = r ? t.stopPropagation: i;
                            s && n && n.apply(e),
                            a && i && i.apply(e)
                        }
                        var u = {
                            view: this,
                            model: this.model,
                            collection: this.collection
                        };
                        this.triggerMethod(o, u)
                    }
                },
                this),
                e
            }
        },
        delegateEvents: function(e) {
            this._delegateDOMEvents(e),
            r.bindEntityEvents(this, this.model, r.getOption(this, "modelEvents")),
            r.bindEntityEvents(this, this.collection, r.getOption(this, "collectionEvents"))
        },
        _delegateDOMEvents: function(e) {
            e = e || this.events,
            n.isFunction(e) && (e = e.call(this));
            var i = {},
            r = this.configureTriggers();
            n.extend(i, e, r),
            t.View.prototype.delegateEvents.call(this, i)
        },
        undelegateEvents: function() {
            var e = Array.prototype.slice.call(arguments);
            t.View.prototype.undelegateEvents.apply(this, e),
            r.unbindEntityEvents(this, this.model, r.getOption(this, "modelEvents")),
            r.unbindEntityEvents(this, this.collection, r.getOption(this, "collectionEvents"))
        },
        onShowCalled: function() {},
        close: function() {
            if (!this.isClosed) {
                var e = this.triggerMethod("before:close");
                e !== !1 && (this.isClosed = !0, this.triggerMethod("close"), this.unbindUIElements(), this.remove())
            }
        },
        bindUIElements: function() {
            if (this.ui) {
                this._uiBindings || (this._uiBindings = this.ui);
                var e = n.result(this, "_uiBindings");
                this.ui = {},
                n.each(n.keys(e),
                function(t) {
                    var n = e[t];
                    this.ui[t] = this.$(n)
                },
                this)
            }
        },
        unbindUIElements: function() {
            this.ui && this._uiBindings && (n.each(this.ui,
            function(e, t) {
                delete this.ui[t]
            },
            this), this.ui = this._uiBindings, delete this._uiBindings)
        }
    }),
    r.ItemView = r.View.extend({
        constructor: function() {
            r.View.prototype.constructor.apply(this, arguments)
        },
        serializeData: function() {
            var e = {};
            return this.model ? e = this.model.toJSON() : this.collection && (e = {
                items: this.collection.toJSON()
            }),
            e
        },
        render: function() {
            this.isClosed = !1,
            this.triggerMethod("before:render", this),
            this.triggerMethod("item:before:render", this);
            var e = this.serializeData();
            e = this.mixinTemplateHelpers(e);
            var t = this.getTemplate(),
            n = r.Renderer.render(t, e);
            return this.$el.html(n),
            this.bindUIElements(),
            this.triggerMethod("render", this),
            this.triggerMethod("item:rendered", this),
            this
        },
        close: function() {
            this.isClosed || (this.triggerMethod("item:before:close"), r.View.prototype.close.apply(this, arguments), this.triggerMethod("item:closed"))
        }
    }),
    r.CollectionView = r.View.extend({
        itemViewEventPrefix: "itemview",
        constructor: function() {
            this._initChildViewStorage(),
            r.View.prototype.constructor.apply(this, arguments),
            this._initialEvents(),
            this.initRenderBuffer()
        },
        initRenderBuffer: function() {
            this.elBuffer = document.createDocumentFragment(),
            this._bufferedChildren = []
        },
        startBuffering: function() {
            this.initRenderBuffer(),
            this.isBuffering = !0
        },
        endBuffering: function() {
            this.isBuffering = !1,
            this.appendBuffer(this, this.elBuffer),
            this._triggerShowBufferedChildren(),
            this.initRenderBuffer()
        },
        _triggerShowBufferedChildren: function() {
            this._isShown && (n.each(this._bufferedChildren,
            function(e) {
                r.triggerMethod.call(e, "show")
            }), this._bufferedChildren = [])
        },
        _initialEvents: function() {
            this.collection && (this.listenTo(this.collection, "add", this.addChildView), this.listenTo(this.collection, "remove", this.removeItemView), this.listenTo(this.collection, "reset", this.render))
        },
        addChildView: function(e) {
            this.closeEmptyView();
            var t = this.getItemView(e),
            n = this.collection.indexOf(e);
            this.addItemView(e, t, n)
        },
        onShowCalled: function() {
            this.children.each(function(e) {
                r.triggerMethod.call(e, "show")
            })
        },
        triggerBeforeRender: function() {
            this.triggerMethod("before:render", this),
            this.triggerMethod("collection:before:render", this)
        },
        triggerRendered: function() {
            this.triggerMethod("render", this),
            this.triggerMethod("collection:rendered", this)
        },
        render: function() {
            return this.isClosed = !1,
            this.triggerBeforeRender(),
            this._renderChildren(),
            this.triggerRendered(),
            this
        },
        _renderChildren: function() {
            this.startBuffering(),
            this.closeEmptyView(),
            this.closeChildren(),
            this.isEmpty(this.collection) ? this.showEmptyView() : this.showCollection(),
            this.endBuffering()
        },
        showCollection: function() {
            var e;
            this.collection.each(function(t, n) {
                e = this.getItemView(t),
                this.addItemView(t, e, n)
            },
            this)
        },
        showEmptyView: function() {
            var e = this.getEmptyView();
            if (e && !this._showingEmptyView) {
                this._showingEmptyView = !0;
                var n = new t.Model;
                this.addItemView(n, e, 0)
            }
        },
        closeEmptyView: function() {
            this._showingEmptyView && (this.closeChildren(), delete this._showingEmptyView)
        },
        getEmptyView: function() {
            return r.getOption(this, "emptyView")
        },
        getItemView: function() {
            var e = r.getOption(this, "itemView");
            return e || i("An `itemView` must be specified", "NoItemViewError"),
            e
        },
        addItemView: function(e, t, i) {
            var o = r.getOption(this, "itemViewOptions");
            n.isFunction(o) && (o = o.call(this, e, i));
            var s = this.buildItemView(e, t, o);
            return this.addChildViewEventForwarding(s),
            this.triggerMethod("before:item:added", s),
            this.children.add(s),
            this.renderItemView(s, i),
            this._isShown && !this.isBuffering && r.triggerMethod.call(s, "show"),
            this.triggerMethod("after:item:added", s),
            s
        },
        addChildViewEventForwarding: function(e) {
            var t = r.getOption(this, "itemViewEventPrefix");
            this.listenTo(e, "all",
            function() {
                var i = o.call(arguments),
                s = i[0],
                a = this.normalizeMethods(this.getItemEvents());
                i[0] = t + ":" + s,
                i.splice(1, 0, e),
                "undefined" != typeof a && n.isFunction(a[s]) && a[s].apply(this, i),
                r.triggerMethod.apply(this, i)
            },
            this)
        },
        getItemEvents: function() {
            return n.isFunction(this.itemEvents) ? this.itemEvents.call(this) : this.itemEvents
        },
        renderItemView: function(e, t) {
            e.render(),
            this.appendHtml(this, e, t)
        },
        buildItemView: function(e, t, i) {
            var r = n.extend({
                model: e
            },
            i);
            return new t(r)
        },
        removeItemView: function(e) {
            var t = this.children.findByModel(e);
            this.removeChildView(t),
            this.checkEmpty()
        },
        removeChildView: function(e) {
            e && (this.stopListening(e), e.close ? e.close() : e.remove && e.remove(), this.children.remove(e)),
            this.triggerMethod("item:removed", e)
        },
        isEmpty: function() {
            return ! this.collection || 0 === this.collection.length
        },
        checkEmpty: function() {
            this.isEmpty(this.collection) && this.showEmptyView()
        },
        appendBuffer: function(e, t) {
            e.$el.append(t)
        },
        appendHtml: function(e, t) {
            e.isBuffering ? (e.elBuffer.appendChild(t.el), e._bufferedChildren.push(t)) : e.$el.append(t.el)
        },
        _initChildViewStorage: function() {
            this.children = new t.ChildViewContainer
        },
        close: function() {
            this.isClosed || (this.triggerMethod("collection:before:close"), this.closeChildren(), this.triggerMethod("collection:closed"), r.View.prototype.close.apply(this, arguments))
        },
        closeChildren: function() {
            this.children.each(function(e) {
                this.removeChildView(e)
            },
            this),
            this.checkEmpty()
        }
    }),
    r.CompositeView = r.CollectionView.extend({
        constructor: function() {
            r.CollectionView.prototype.constructor.apply(this, arguments)
        },
        _initialEvents: function() {
            this.once("render",
            function() {
                this.collection && (this.listenTo(this.collection, "add", this.addChildView), this.listenTo(this.collection, "remove", this.removeItemView), this.listenTo(this.collection, "reset", this._renderChildren))
            })
        },
        getItemView: function() {
            var e = r.getOption(this, "itemView") || this.constructor;
            return e || i("An `itemView` must be specified", "NoItemViewError"),
            e
        },
        serializeData: function() {
            var e = {};
            return this.model && (e = this.model.toJSON()),
            e
        },
        render: function() {
            this.isRendered = !0,
            this.isClosed = !1,
            this.resetItemViewContainer(),
            this.triggerBeforeRender();
            var e = this.renderModel();
            return this.$el.html(e),
            this.bindUIElements(),
            this.triggerMethod("composite:model:rendered"),
            this._renderChildren(),
            this.triggerMethod("composite:rendered"),
            this.triggerRendered(),
            this
        },
        _renderChildren: function() {
            this.isRendered && (this.triggerMethod("composite:collection:before:render"), r.CollectionView.prototype._renderChildren.call(this), this.triggerMethod("composite:collection:rendered"))
        },
        renderModel: function() {
            var e = {};
            e = this.serializeData(),
            e = this.mixinTemplateHelpers(e);
            var t = this.getTemplate();
            return r.Renderer.render(t, e)
        },
        appendBuffer: function(e, t) {
            var n = this.getItemViewContainer(e);
            n.append(t)
        },
        appendHtml: function(e, t) {
            if (e.isBuffering) e.elBuffer.appendChild(t.el),
            e._bufferedChildren.push(t);
            else {
                var n = this.getItemViewContainer(e);
                n.append(t.el)
            }
        },
        getItemViewContainer: function(e) {
            if ("$itemViewContainer" in e) return e.$itemViewContainer;
            var t, o = r.getOption(e, "itemViewContainer");
            if (o) {
                var s = n.isFunction(o) ? o.call(this) : o;
                t = e.$(s),
                t.length <= 0 && i("The specified `itemViewContainer` was not found: " + e.itemViewContainer, "ItemViewContainerMissingError")
            } else t = e.$el;
            return e.$itemViewContainer = t,
            t
        },
        resetItemViewContainer: function() {
            this.$itemViewContainer && delete this.$itemViewContainer
        }
    }),
    r.Layout = r.ItemView.extend({
        regionType: r.Region,
        constructor: function(e) {
            e = e || {},
            this._firstRender = !0,
            this._initializeRegions(e),
            r.ItemView.prototype.constructor.call(this, e)
        },
        render: function() {
            return this.isClosed && this._initializeRegions(),
            this._firstRender ? this._firstRender = !1 : this.isClosed || this._reInitializeRegions(),
            r.ItemView.prototype.render.apply(this, arguments)
        },
        close: function() {
            this.isClosed || (this.regionManager.close(), r.ItemView.prototype.close.apply(this, arguments))
        },
        addRegion: function(e, t) {
            var n = {};
            return n[e] = t,
            this._buildRegions(n)[e]
        },
        addRegions: function(e) {
            return this.regions = n.extend({},
            this.regions, e),
            this._buildRegions(e)
        },
        removeRegion: function(e) {
            return delete this.regions[e],
            this.regionManager.removeRegion(e)
        },
        _buildRegions: function(e) {
            var t = this,
            n = {
                regionType: r.getOption(this, "regionType"),
                parentEl: function() {
                    return t.$el
                }
            };
            return this.regionManager.addRegions(e, n)
        },
        _initializeRegions: function(e) {
            var t;
            this._initRegionManager(),
            t = n.isFunction(this.regions) ? this.regions(e) : this.regions || {},
            this.addRegions(t)
        },
        _reInitializeRegions: function() {
            this.regionManager.closeRegions(),
            this.regionManager.each(function(e) {
                e.reset()
            })
        },
        _initRegionManager: function() {
            this.regionManager = new r.RegionManager,
            this.listenTo(this.regionManager, "region:add",
            function(e, t) {
                this[e] = t,
                this.trigger("region:add", e, t)
            }),
            this.listenTo(this.regionManager, "region:remove",
            function(e, t) {
                delete this[e],
                this.trigger("region:remove", e, t)
            })
        }
    }),
    r.AppRouter = t.Router.extend({
        constructor: function(e) {
            t.Router.prototype.constructor.apply(this, arguments),
            this.options = e || {};
            var n = r.getOption(this, "appRoutes"),
            i = this._getController();
            this.processAppRoutes(i, n)
        },
        appRoute: function(e, t) {
            var n = this._getController();
            this._addAppRoute(n, e, t)
        },
        processAppRoutes: function(e, t) {
            if (t) {
                var i = n.keys(t).reverse();
                n.each(i,
                function(n) {
                    this._addAppRoute(e, n, t[n])
                },
                this)
            }
        },
        _getController: function() {
            return r.getOption(this, "controller")
        },
        _addAppRoute: function(e, t, r) {
            var o = e[r];
            o || i("Method '" + r + "' was not found on the controller"),
            this.route(t, r, n.bind(o, e))
        }
    }),
    r.Application = function(e) {
        this._initRegionManager(),
        this._initCallbacks = new r.Callbacks,
        this.vent = new t.Wreqr.EventAggregator,
        this.commands = new t.Wreqr.Commands,
        this.reqres = new t.Wreqr.RequestResponse,
        this.submodules = {},
        n.extend(this, e),
        this.triggerMethod = r.triggerMethod
    },
    n.extend(r.Application.prototype, t.Events, {
        execute: function() {
            this.commands.execute.apply(this.commands, arguments)
        },
        request: function() {
            return this.reqres.request.apply(this.reqres, arguments)
        },
        addInitializer: function(e) {
            this._initCallbacks.add(e)
        },
        start: function(e) {
            this.triggerMethod("initialize:before", e),
            this._initCallbacks.run(e, this),
            this.triggerMethod("initialize:after", e),
            this.triggerMethod("start", e)
        },
        addRegions: function(e) {
            return this._regionManager.addRegions(e)
        },
        closeRegions: function() {
            this._regionManager.closeRegions()
        },
        removeRegion: function(e) {
            this._regionManager.removeRegion(e)
        },
        getRegion: function(e) {
            return this._regionManager.get(e)
        },
        module: function(e, t) {
            var n = r.Module.getClass(t),
            i = o.call(arguments);
            return i.unshift(this),
            n.create.apply(n, i)
        },
        _initRegionManager: function() {
            this._regionManager = new r.RegionManager,
            this.listenTo(this._regionManager, "region:add",
            function(e, t) {
                this[e] = t
            }),
            this.listenTo(this._regionManager, "region:remove",
            function(e) {
                delete this[e]
            })
        }
    }),
    r.Application.extend = r.extend,
    r.Module = function(e, t, i) {
        this.moduleName = e,
        this.options = n.extend({},
        this.options, i),
        this.initialize = i.initialize || this.initialize,
        this.submodules = {},
        this._setupInitializersAndFinalizers(),
        this.app = t,
        this.startWithParent = !0,
        this.triggerMethod = r.triggerMethod,
        n.isFunction(this.initialize) && this.initialize(this.options, e, t)
    },
    r.Module.extend = r.extend,
    n.extend(r.Module.prototype, t.Events, {
        initialize: function() {},
        addInitializer: function(e) {
            this._initializerCallbacks.add(e)
        },
        addFinalizer: function(e) {
            this._finalizerCallbacks.add(e)
        },
        start: function(e) {
            this._isInitialized || (n.each(this.submodules,
            function(t) {
                t.startWithParent && t.start(e)
            }), this.triggerMethod("before:start", e), this._initializerCallbacks.run(e, this), this._isInitialized = !0, this.triggerMethod("start", e))
        },
        stop: function() {
            this._isInitialized && (this._isInitialized = !1, r.triggerMethod.call(this, "before:stop"), n.each(this.submodules,
            function(e) {
                e.stop()
            }), this._finalizerCallbacks.run(void 0, this), this._initializerCallbacks.reset(), this._finalizerCallbacks.reset(), r.triggerMethod.call(this, "stop"))
        },
        addDefinition: function(e, t) {
            this._runModuleDefinition(e, t)
        },
        _runModuleDefinition: function(e, i) {
            if (e) {
                var o = n.flatten([this, this.app, t, r, r.$, n, i]);
                e.apply(this, o)
            }
        },
        _setupInitializersAndFinalizers: function() {
            this._initializerCallbacks = new r.Callbacks,
            this._finalizerCallbacks = new r.Callbacks
        }
    }),
    n.extend(r.Module, {
        create: function(e, t, i) {
            var r = e,
            s = o.call(arguments);
            s.splice(0, 3),
            t = t.split(".");
            var a = t.length,
            u = [];
            return u[a - 1] = i,
            n.each(t,
            function(t, n) {
                var o = r;
                r = this._getModule(o, t, e, i),
                this._addModuleDefinition(o, r, u[n], s)
            },
            this),
            r
        },
        _getModule: function(e, t, i, r) {
            var o = n.extend({},
            r),
            s = this.getClass(r),
            a = e[t];
            return a || (a = new s(t, i, o), e[t] = a, e.submodules[t] = a),
            a
        },
        getClass: function(e) {
            var t = r.Module;
            return e ? e.prototype instanceof t ? e: e.moduleClass || t: t
        },
        _addModuleDefinition: function(e, t, i, o) {
            var s, a; ! n.isFunction(i) || i.prototype instanceof r.Module ? n.isObject(i) ? (s = i.define, a = n.isUndefined(i.startWithParent) ? !0 : i.startWithParent) : a = !0 : (s = i, a = !0),
            s && t.addDefinition(s, o),
            t.startWithParent = t.startWithParent && a,
            t.startWithParent && !t.startWithParentIsConfigured && (t.startWithParentIsConfigured = !0, e.addInitializer(function(e) {
                t.startWithParent && t.start(e)
            }))
        }
    }),
    r
} (this, Backbone, _);
define("marionette", ["backbone"],
function(e) {
    return function() {
        var t;
        return t || e.Marionette
    }
} (this)),
define("text!templates/register.html", [],
function() {
    return '<div class="reg-main">\n    <div id="reg-timeline-container"></div>\n    <div class="reg-main-body">\n        <form id="registerForm" role="form" action="#" method="post">\n            <table>\n                <tbody>\n                    <tr>\n                        <td>\n                            <img src="/public/images/portrait.png" class="pr22 mt-8"/>\n                        </td>\n                        <td class="text-right">\n                            <label for="user_email">请输入邮箱<span class="asterisk">*</span></label>\n                        </td>\n                        <td>\n                            <input id="user_email" name="user_email" type="text" class="form-control" placeholder="电子邮箱将作为您的账户名"/>\n                        </td>\n                        <td rowspan="6" class="advertisement">\n                            <div class="dashed-line pull-left"></div>\n                            <p class="mb5">欢迎您使用UCloud！</p>\n                            <p class="mb10">\n                                领先的性能&nbsp;&nbsp;&nbsp;&nbsp;合理的价格<br/>\n                                丰富的产品&nbsp;&nbsp;&nbsp;&nbsp;快速的响应\n                            </p>\n                            <p>\n                                注册成功即可享用<br/>\n                                免费试用云服务器5天！\n                            </p>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td colspan="2" class="text-right">\n                            <label for="user_pwd">设定密码<span class="asterisk">*</span></label>\n                        </td>\n                        <td>\n                            <input id="user_pwd" name="user_pwd" type="password" class="form-control" data-error-placement="last"/>\n                            <div id="pass-strength-container"></div>\n                            <label id="passStrengthError" for="user_pwd" class="error" style="display:none;"></label>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td colspan="2" class="text-right">\n                            <label for="user_repasswd">确认密码<span class="asterisk">*</span></label>\n                        </td>\n                        <td class="pb25">\n                            <input id="user_repasswd" name="user_repasswd" type="password" class="form-control"/>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                            <img src="/public/images/phone.png" class="pr22 mt-8"/>\n                        </td>\n                        <td class="text-right">\n                            <label for="user_phone">手机号码<span class="asterisk">*</span></label>\n                        </td>\n                        <td>\n                            <input id="user_phone" name="user_phone" type="text" class="form-control"/><br />\n                            <label><input type="radio" name="verify-method" value="0" /><span class="radio-text">短信验证</span></label>\n                            <label><input type="radio" name="verify-method" value="1" checked /><span class="radio-text">电话验证</span></label><br />\n                            <p class="verify-info msg-verify">\n                                <img src="/public/images/register_arrow_top.png"/>\n                                请查看您的手机并填写短信中的验证码 \n                            </p>\n                            <p class="verify-info phone-verify">\n                                <img src="/public/images/register_arrow_top.png"/>\n                                您将收到语音来电，并播报三次验证码 \n                            </p>\n                            <p class="no-verify-code" style="display:none">\n                                收不到验证码?<a target="_blank" href="http://b.qq.com/webc.htm?new=0&amp;sid=4000188113&amp;eid=218808P8z8p8x8Q808Q8Q&amp;o=http://www.ucloud.cn&amp;q=7&amp;ref=http://www.ucloud.cn/help">联系技术支持</a>\n                            </p>\n                        </td>\n                    </tr>\n                    <tr id="img-verification-row">\n                        <td colspan="2" class="text-right">\n                            <label for="verification">图片验证<span class="asterisk">*</span></label>\n                        </td>\n                        <td>\n                            <input id="img-verification" name="img-verification" type="text" class="form-control verify-code-input">\n                            <img id="verification-code-img" class="verification-code-img" src="/cas/login/verification_code">\n                            <a id="refresh" href="#"><img src="/public/images/refresh.jpg" class="mt-6"/></a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td colspan="2" class="text-right">\n                            <label for="verifyCode">验证码<span class="asterisk">*</span></label>\n                        </td>\n                        <td>\n                            <input id="verifyCode" name="verifyCode" type="text" class="form-control verify-code-input" data-error-placement="last"/>\n                            <button id="sendPhoneCode" type="button" class="u-btn u-btn-default mt-3">获取验证码</button>\n                            <br />\n                        </td>\n                    </tr>\n                    <tr id="error-tip-container" style="display:none">\n                        <td colspan="2"></td>\n                        <td>\n                            <div class="error-tip-container" style="display:block">\n                                <label></label>\n                            </div>\n                        </td>\n                    <tr>\n                    <tr>\n                        <td colspan="2"></td>\n                        <td>\n                            <button type="submit" class="u-btn u-btn-primary">同意注册协议并提交</button>\n                            <a class="reg-protocol" target="_blank" href="/account/cas/user_agreement">《UCloud用户注册协议》</a>\n                        </td>\n                    <tr>\n                </tbody>\n            </table>\n        </form>\n    </div>\n</div>\n'
}),
define("text!templates/timeline_widget.html", [],
function() {
    return '<ul class="reg-timeline nav nav-tabs">\n    <li>\n        <div class="hr active"></div>\n        <img src="/public/images/register_step_1.png"/>\n        <br />\n        <span>账号信息</span>\n    </li>\n    <li>\n        <div class="hr <% if (step >= 2) { %>active<% } %>"></div>\n        <img src="/public/images/register_step_2<% if (step >= 2) { %>_active<% } %>.png"/>\n        <br />\n        <span>完善资料</span>\n    </li>\n    <li>\n        <div class="hr <% if (step >= 3) { %>active<% } %>"></div>\n        <img src="/public/images/register_step_3<% if (step >= 3) { %>_active<% } %>.png"/>\n        <br />\n        <span>激活账号</span>\n    </li>\n    <li>\n        <div class="hr <% if (step >= 4) { %>active<% } %>"></div>\n        <img src="/public/images/register_step_4<% if (step >= 4) { %>_active<% } %>.png"/>\n        <br />\n        <span>完成</span>\n    </li>\n</ul>\n'
}),
define("javascripts/widgets/reg_timeline", ["require", "exports", "module", "underscore", "marionette", "text!templates/timeline_widget.html"],
function(e, t, n) {
    var i = e("underscore"),
    r = e("marionette"),
    o = e("text!templates/timeline_widget.html");
    n.exports = r.ItemView.extend({
        template: i.template(o),
        ui: {
            timeline: "#reg-timeline"
        }
    })
}),
define("text!templates/password_strength_widget.html", [],
function() {
    return '<ul class="password-strength-ul">\n    <li class="password-strength <% if (strength > 1) { %>active<% } %>">弱</li>\n    <li class="password-strength <% if (strength > 2) { %>active<% } %>">中</li>\n    <li class="password-strength <% if (strength > 3) { %>active<% } %>">强</li>\n</ul>\n'
}),
define("javascripts/widgets/password_strength", ["require", "exports", "module", "underscore", "jquery", "backbone", "marionette", "text!templates/password_strength_widget.html"],
function(e, t, n) {
    function i(e, t, n) {
        if (e.match(/\s/)) return - 1;
        if (!o.trim(e) || e.length < t || e.length > n) return 0;
        var i = e.match(l) ? 1 : 0,
        r = e.match(c) ? 1 : 0,
        s = e.match(d) ? 1 : 0,
        a = e.match(h),
        u = i + r + s + (a ? 1 : 0);
        return a && a.length >= 6 && u >= 2 && 4 > u && u++,
        u
    }
    var r = e("underscore"),
    o = e("jquery"),
    s = e("backbone"),
    a = e("marionette"),
    u = e("text!templates/password_strength_widget.html"),
    l = /[A-Z]/,
    c = /[a-z]/,
    d = /[0-9]/,
    h = /[^A-Za-z0-9]/g;
    n.exports = a.ItemView.extend({
        model: new s.Model({
            strength: 0,
            minLength: 6,
            maxLength: 20
        }),
        template: r.template(u),
        setPassword: function(e) {
            var t = this;
            t.model.set({
                strength: i(e, t.model.get("minLength"), t.model.get("maxLength"))
            }),
            t.render()
        },
        valid: function() {
            var e = this.model.get("strength");
            return e >= 2
        }
    })
}),
define("javascripts/views/register_view", ["require", "exports", "module", "underscore", "jquery", "backbone", "marionette", "text!templates/register.html", "javascripts/widgets/reg_timeline", "javascripts/widgets/password_strength"],
function(e, t, n) {
    function i(e) {
        e.validate({
            rules: {
                user_email: {
                    required: !0,
                    email: !0,
                    remote: {
                        url: "/account/cas/checkemail",
                        type: "post"
                    }
                },
                user_pwd: {
                    required: !0,
                    rangelength: [6, 20]
                },
                user_repasswd: {
                    required: !0,
                    equalTo: "#user_pwd"
                },
                user_phone: {
                    required: !0,
                    digits: !0,
                    rangelength: [11, 11],
                    remote: {
                        beforeSend: function() {
                            f = !0
                        },
                        complete: function() {
                            f = !1
                        },
                        url: "/account/cas/check_phone",
                        type: "post"
                    }
                },
                "img-verification": "required",
                verifyCode: "required"
            },
            messages: {
                user_email: {
                    required: "请输入邮箱",
                    email: "请输入正确的Email地址",
                    remote: "此邮箱已存在"
                },
                user_pwd: {
                    required: "请输入密码",
                    rangelength: a.validator.format("长度必须在{0}-{1}之间")
                },
                user_repasswd: {
                    required: "请输入确认密码",
                    equalTo: "两次输入密码不一致"
                },
                user_phone: {
                    required: "请输入手机号",
                    digits: "手机号有误",
                    rangelength: "手机号有误",
                    remote: "手机号已存在"
                },
                "img-verification": " ",
                verifyCode: "请输入验证码"
            },
            errorPlacement: function(e, t) {
                "last" == t.data("error-placement") ? e.appendTo(t.parent()) : t.after(e)
            }
        })
    }
    function r() {
        var e = this,
        t = e.passwordStrengthWidget.valid();
        return e.ui.passStrengthError.is(":hidden") && !t && (e.ui.passStrengthError.text("大小写字母、数字及符号（除空格）至少包含两种"), e.ui.passStrengthError.show()),
        t
    }
    var o, s = e("underscore"),
    a = e("jquery"),
    u = e("backbone"),
    l = e("marionette"),
    c = e("text!templates/register.html"),
    d = e("javascripts/widgets/reg_timeline"),
    h = e("javascripts/widgets/password_strength"),
    f = !1;
    n.exports = l.Layout.extend({
        template: s.template(c),
        regions: {
            timelineRegion: "#reg-timeline-container",
            passwordStrengthRegion: "#pass-strength-container"
        },
        ui: {
            form: "#registerForm",
            user_email: "#user_email",
            user_pwd: "#user_pwd",
            user_phone: "#user_phone",
            verifyCode: "#verifyCode",
            verifyInfo: ".verify-info",
            imgVerification: "#img-verification",
            verifyCodeImg: "#verification-code-img",
            noVerifyCode: "p.no-verify-code",
            sendPhoneCodeBtn: "#sendPhoneCode",
            refreshBtn: "#refresh",
            errorTipContainer: "#error-tip-container",
            passStrengthError: "#passStrengthError"
        },
        events: {
            "keyup #user_pwd": "onPasswordChange",
            "focusout #user_pwd": "onPasswordFocusOut",
            "click button[type=submit]": "onSubmit",
            "change input[name=verify-method]": "onVerifyMethodChange",
            "click #refresh": "refreshCodeImg",
            "click #sendPhoneCode": "onSendPhoneCode"
        },
        initialize: function() {
            this.passwordStrengthWidget = new h
        },
        onRender: function() {
            var e = this;
            e.timelineRegion.show(new d({
                model: new u.Model({
                    step: 1
                })
            })),
            e.passwordStrengthRegion.show(e.passwordStrengthWidget),
            i(e.ui.form),
            o = e.ui.verifyCodeImg.attr("src")
        },
        onPasswordChange: function() {
            var e = this;
            e.passwordStrengthWidget.setPassword(e.ui.user_pwd.val())
        },
        onPasswordFocusOut: function() {
            r.call(this)
        },
        onVerifyMethodChange: function() {
            this.ui.verifyInfo.toggle();
            this.$("input[name=verify-method]:checked").val(),
            a("tr#img-verification-row")
        },
        refreshCodeImg: function(e) {
            e.preventDefault(),
            this.ui.verifyCodeImg.attr("src", o + "?" + Date.now())
        },
        onSendPhoneCode: function(e) {
            var t = this,
            n = a(e.currentTarget);
            if (e.preventDefault(), t.ui.user_phone.hasClass("error") || !t.ui.user_phone.val() || f) return void t.ui.user_phone.focus();
            var i, r = {
                user_phone: t.ui.user_phone.val(),
                send_type: t.$("input[name=verify-method]:checked").val()
            };
            r.img_verification = t.ui.imgVerification.val(),
            a.post("/account/cas/send_phone_code", r,
            function(e) {
                if (0 == e.ret_code) {
                    n.attr("disabled", !0);
                    var r = 60;
                    i = setInterval(function() {
                        r--,
                        n.text("( " + r + " )   秒后重新发送"),
                        0 >= r && (t.ui.noVerifyCode.show(), n.attr("ready", !1), clearInterval(i), n.attr("disabled", !1), n.text("获取验证码"))
                    },
                    1e3)
                } else t.ui.errorTipContainer.find("label").text(e.error_message),
                t.ui.errorTipContainer.fadeIn().delay(3e3).fadeOut(),
                n.attr("ready", !1)
            },
            "json")
        },
        onSubmit: function() {
            var e = this,
            t = void 0;
            return e.ui.form.valid() && (t = r.call(e)) && !f ? (a.ajax({
                url: "/cas/register",
                type: "POST",
                dataType: "json",
                data: e.ui.form.serializeArray()
            }).done(function(t) {
                0 != t.ret_code ? (e.ui.errorTipContainer.find("label").text(t.error_message), e.ui.errorTipContainer.show()) : window.location.href = t.redirect
            }).fail(function() {
                e.ui.errorTipContainer.find("label").text("注册失败请联系技术支持"),
                e.ui.errorTipContainer.show()
            }), !1) : (void 0 === t && r.call(e), !1)
        }
    })
}),
define("register_app", ["require", "jquery", "marionette", "javascripts/views/register_view"],
function(e) {
    var t = (e("jquery"), e("marionette")),
    n = e("javascripts/views/register_view"),
    i = new t.Application;
    return i.addRegions({
        viewRegion: "#view-container"
    }),
    i.on("initialize:after",
    function() {
        i.viewRegion.show(new n)
    }),
    i
}),
function(e) {
    e.extend(e.fn, {
        validate: function(t) {
            if (!this.length) return void(t && t.debug && window.console && console.warn("Nothing selected, can't validate, returning nothing."));
            var n = e.data(this[0], "validator");
            return n ? n: (this.attr("novalidate", "novalidate"), n = new e.validator(t, this[0]), e.data(this[0], "validator", n), n.settings.onsubmit && (this.validateDelegate(":submit", "click",
            function(t) {
                n.settings.submitHandler && (n.submitButton = t.target),
                e(t.target).hasClass("cancel") && (n.cancelSubmit = !0),
                void 0 !== e(t.target).attr("formnovalidate") && (n.cancelSubmit = !0)
            }), this.submit(function(t) {
                function i() {
                    var i;
                    return n.settings.submitHandler ? (n.submitButton && (i = e("<input type='hidden'/>").attr("name", n.submitButton.name).val(e(n.submitButton).val()).appendTo(n.currentForm)), n.settings.submitHandler.call(n, n.currentForm, t), n.submitButton && i.remove(), !1) : !0
                }
                return n.settings.debug && t.preventDefault(),
                n.cancelSubmit ? (n.cancelSubmit = !1, i()) : n.form() ? n.pendingRequest ? (n.formSubmitted = !0, !1) : i() : (n.focusInvalid(), !1)
            })), n)
        },
        valid: function() {
            if (e(this[0]).is("form")) return this.validate().form();
            var t = !0,
            n = e(this[0].form).validate();
            return this.each(function() {
                t = t && n.element(this)
            }),
            t
        },
        removeAttrs: function(t) {
            var n = {},
            i = this;
            return e.each(t.split(/\s/),
            function(e, t) {
                n[t] = i.attr(t),
                i.removeAttr(t)
            }),
            n
        },
        rules: function(t, n) {
            var i = this[0];
            if (t) {
                var r = e.data(i.form, "validator").settings,
                o = r.rules,
                s = e.validator.staticRules(i);
                switch (t) {
                case "add":
                    e.extend(s, e.validator.normalizeRule(n)),
                    delete s.messages,
                    o[i.name] = s,
                    n.messages && (r.messages[i.name] = e.extend(r.messages[i.name], n.messages));
                    break;
                case "remove":
                    if (!n) return delete o[i.name],
                    s;
                    var a = {};
                    return e.each(n.split(/\s/),
                    function(e, t) {
                        a[t] = s[t],
                        delete s[t]
                    }),
                    a
                }
            }
            var u = e.validator.normalizeRules(e.extend({},
            e.validator.classRules(i), e.validator.attributeRules(i), e.validator.dataRules(i), e.validator.staticRules(i)), i);
            if (u.required) {
                var l = u.required;
                delete u.required,
                u = e.extend({
                    required: l
                },
                u)
            }
            return u
        }
    }),
    e.extend(e.expr[":"], {
        blank: function(t) {
            return ! e.trim("" + e(t).val())
        },
        filled: function(t) {
            return !! e.trim("" + e(t).val())
        },
        unchecked: function(t) {
            return ! e(t).prop("checked")
        }
    }),
    e.validator = function(t, n) {
        this.settings = e.extend(!0, {},
        e.validator.defaults, t),
        this.currentForm = n,
        this.init()
    },
    e.validator.format = function(t, n) {
        return 1 === arguments.length ?
        function() {
            var n = e.makeArray(arguments);
            return n.unshift(t),
            e.validator.format.apply(this, n)
        }: (arguments.length > 2 && n.constructor !== Array && (n = e.makeArray(arguments).slice(1)), n.constructor !== Array && (n = [n]), e.each(n,
        function(e, n) {
            t = t.replace(new RegExp("\\{" + e + "\\}", "g"),
            function() {
                return n
            })
        }), t)
    },
    e.extend(e.validator, {
        defaults: {
            messages: {},
            groups: {},
            rules: {},
            errorClass: "error",
            validClass: "valid",
            errorElement: "label",
            focusInvalid: !0,
            errorContainer: e([]),
            errorLabelContainer: e([]),
            onsubmit: !0,
            ignore: ":hidden",
            ignoreTitle: !1,
            onfocusin: function(e) {
                this.lastActive = e,
                this.settings.focusCleanup && !this.blockFocusCleanup && (this.settings.unhighlight && this.settings.unhighlight.call(this, e, this.settings.errorClass, this.settings.validClass), this.addWrapper(this.errorsFor(e)).hide())
            },
            onfocusout: function(e) {
                this.checkable(e) || !(e.name in this.submitted) && this.optional(e) || this.element(e)
            },
            onkeyup: function(e, t) { (9 !== t.which || "" !== this.elementValue(e)) && (e.name in this.submitted || e === this.lastElement) && this.element(e)
            },
            onclick: function(e) {
                e.name in this.submitted ? this.element(e) : e.parentNode.name in this.submitted && this.element(e.parentNode)
            },
            highlight: function(t, n, i) {
                "radio" === t.type ? this.findByName(t.name).addClass(n).removeClass(i) : e(t).addClass(n).removeClass(i)
            },
            unhighlight: function(t, n, i) {
                "radio" === t.type ? this.findByName(t.name).removeClass(n).addClass(i) : e(t).removeClass(n).addClass(i)
            }
        },
        setDefaults: function(t) {
            e.extend(e.validator.defaults, t)
        },
        messages: {
            required: "This field is required.",
            remote: "Please fix this field.",
            email: "Please enter a valid email address.",
            url: "Please enter a valid URL.",
            date: "Please enter a valid date.",
            dateISO: "Please enter a valid date (ISO).",
            number: "Please enter a valid number.",
            digits: "Please enter only digits.",
            creditcard: "Please enter a valid credit card number.",
            equalTo: "Please enter the same value again.",
            maxlength: e.validator.format("Please enter no more than {0} characters."),
            minlength: e.validator.format("Please enter at least {0} characters."),
            rangelength: e.validator.format("Please enter a value between {0} and {1} characters long."),
            range: e.validator.format("Please enter a value between {0} and {1}."),
            max: e.validator.format("Please enter a value less than or equal to {0}."),
            min: e.validator.format("Please enter a value greater than or equal to {0}.")
        },
        autoCreateRanges: !1,
        prototype: {
            init: function() {
                function t(t) {
                    var n = e.data(this[0].form, "validator"),
                    i = "on" + t.type.replace(/^validate/, "");
                    n.settings[i] && n.settings[i].call(n, this[0], t)
                }
                this.labelContainer = e(this.settings.errorLabelContainer),
                this.errorContext = this.labelContainer.length && this.labelContainer || e(this.currentForm),
                this.containers = e(this.settings.errorContainer).add(this.settings.errorLabelContainer),
                this.submitted = {},
                this.valueCache = {},
                this.pendingRequest = 0,
                this.pending = {},
                this.invalid = {},
                this.reset();
                var n = this.groups = {};
                e.each(this.settings.groups,
                function(t, i) {
                    "string" == typeof i && (i = i.split(/\s/)),
                    e.each(i,
                    function(e, i) {
                        n[i] = t
                    })
                });
                var i = this.settings.rules;
                e.each(i,
                function(t, n) {
                    i[t] = e.validator.normalizeRule(n)
                }),
                e(this.currentForm).validateDelegate(":text, [type='password'], [type='file'], select, textarea, [type='number'], [type='search'] ,[type='tel'], [type='url'], [type='email'], [type='datetime'], [type='date'], [type='month'], [type='week'], [type='time'], [type='datetime-local'], [type='range'], [type='color'] ", "focusin focusout keyup", t).validateDelegate("[type='radio'], [type='checkbox'], select, option", "click", t),
                this.settings.invalidHandler && e(this.currentForm).bind("invalid-form.validate", this.settings.invalidHandler)
            },
            form: function() {
                return this.checkForm(),
                e.extend(this.submitted, this.errorMap),
                this.invalid = e.extend({},
                this.errorMap),
                this.valid() || e(this.currentForm).triggerHandler("invalid-form", [this]),
                this.showErrors(),
                this.valid()
            },
            checkForm: function() {
                this.prepareForm();
                for (var e = 0,
                t = this.currentElements = this.elements(); t[e]; e++) this.check(t[e]);
                return this.valid()
            },
            element: function(t) {
                t = this.validationTargetFor(this.clean(t)),
                this.lastElement = t,
                this.prepareElement(t),
                this.currentElements = e(t);
                var n = this.check(t) !== !1;
                return n ? delete this.invalid[t.name] : this.invalid[t.name] = !0,
                this.numberOfInvalids() || (this.toHide = this.toHide.add(this.containers)),
                this.showErrors(),
                n
            },
            showErrors: function(t) {
                if (t) {
                    e.extend(this.errorMap, t),
                    this.errorList = [];
                    for (var n in t) this.errorList.push({
                        message: t[n],
                        element: this.findByName(n)[0]
                    });
                    this.successList = e.grep(this.successList,
                    function(e) {
                        return ! (e.name in t)
                    })
                }
                this.settings.showErrors ? this.settings.showErrors.call(this, this.errorMap, this.errorList) : this.defaultShowErrors()
            },
            resetForm: function() {
                e.fn.resetForm && e(this.currentForm).resetForm(),
                this.submitted = {},
                this.lastElement = null,
                this.prepareForm(),
                this.hideErrors(),
                this.elements().removeClass(this.settings.errorClass).removeData("previousValue")
            },
            numberOfInvalids: function() {
                return this.objectLength(this.invalid)
            },
            objectLength: function(e) {
                var t = 0;
                for (var n in e) t++;
                return t
            },
            hideErrors: function() {
                this.addWrapper(this.toHide).hide()
            },
            valid: function() {
                return 0 === this.size()
            },
            size: function() {
                return this.errorList.length
            },
            focusInvalid: function() {
                if (this.settings.focusInvalid) try {
                    e(this.findLastActive() || this.errorList.length && this.errorList[0].element || []).filter(":visible").focus().trigger("focusin")
                } catch(t) {}
            },
            findLastActive: function() {
                var t = this.lastActive;
                return t && 1 === e.grep(this.errorList,
                function(e) {
                    return e.element.name === t.name
                }).length && t
            },
            elements: function() {
                var t = this,
                n = {};
                return e(this.currentForm).find("input, select, textarea").not(":submit, :reset, :image, [disabled]").not(this.settings.ignore).filter(function() {
                    return ! this.name && t.settings.debug && window.console && console.error("%o has no name assigned", this),
                    this.name in n || !t.objectLength(e(this).rules()) ? !1 : (n[this.name] = !0, !0)
                })
            },
            clean: function(t) {
                return e(t)[0]
            },
            errors: function() {
                var t = this.settings.errorClass.replace(" ", ".");
                return e(this.settings.errorElement + "." + t, this.errorContext)
            },
            reset: function() {
                this.successList = [],
                this.errorList = [],
                this.errorMap = {},
                this.toShow = e([]),
                this.toHide = e([]),
                this.currentElements = e([])
            },
            prepareForm: function() {
                this.reset(),
                this.toHide = this.errors().add(this.containers)
            },
            prepareElement: function(e) {
                this.reset(),
                this.toHide = this.errorsFor(e)
            },
            elementValue: function(t) {
                var n = e(t).attr("type"),
                i = e(t).val();
                return "radio" === n || "checkbox" === n ? e("input[name='" + e(t).attr("name") + "']:checked").val() : "string" == typeof i ? i.replace(/\r/g, "") : i
            },
            check: function(t) {
                t = this.validationTargetFor(this.clean(t));
                var n, i = e(t).rules(),
                r = !1,
                o = this.elementValue(t);
                for (var s in i) {
                    var a = {
                        method: s,
                        parameters: i[s]
                    };
                    try {
                        if (n = e.validator.methods[s].call(this, o, t, a.parameters), "dependency-mismatch" === n) {
                            r = !0;
                            continue
                        }
                        if (r = !1, "pending" === n) return void(this.toHide = this.toHide.not(this.errorsFor(t)));
                        if (!n) return this.formatAndAdd(t, a),
                        !1
                    } catch(u) {
                        throw this.settings.debug && window.console && console.log("Exception occurred when checking element " + t.id + ", check the '" + a.method + "' method.", u),
                        u
                    }
                }
                return r ? void 0 : (this.objectLength(i) && this.successList.push(t), !0)
            },
            customDataMessage: function(t, n) {
                return e(t).data("msg-" + n.toLowerCase()) || t.attributes && e(t).attr("data-msg-" + n.toLowerCase())
            },
            customMessage: function(e, t) {
                var n = this.settings.messages[e];
                return n && (n.constructor === String ? n: n[t])
            },
            findDefined: function() {
                for (var e = 0; e < arguments.length; e++) if (void 0 !== arguments[e]) return arguments[e];
                return void 0
            },
            defaultMessage: function(t, n) {
                return this.findDefined(this.customMessage(t.name, n), this.customDataMessage(t, n), !this.settings.ignoreTitle && t.title || void 0, e.validator.messages[n], "<strong>Warning: No message defined for " + t.name + "</strong>")
            },
            formatAndAdd: function(t, n) {
                var i = this.defaultMessage(t, n.method),
                r = /\$?\{(\d+)\}/g;
                "function" == typeof i ? i = i.call(this, n.parameters, t) : r.test(i) && (i = e.validator.format(i.replace(r, "{$1}"), n.parameters)),
                this.errorList.push({
                    message: i,
                    element: t
                }),
                this.errorMap[t.name] = i,
                this.submitted[t.name] = i
            },
            addWrapper: function(e) {
                return this.settings.wrapper && (e = e.add(e.parent(this.settings.wrapper))),
                e
            },
            defaultShowErrors: function() {
                var e, t;
                for (e = 0; this.errorList[e]; e++) {
                    var n = this.errorList[e];
                    this.settings.highlight && this.settings.highlight.call(this, n.element, this.settings.errorClass, this.settings.validClass),
                    this.showLabel(n.element, n.message)
                }
                if (this.errorList.length && (this.toShow = this.toShow.add(this.containers)), this.settings.success) for (e = 0; this.successList[e]; e++) this.showLabel(this.successList[e]);
                if (this.settings.unhighlight) for (e = 0, t = this.validElements(); t[e]; e++) this.settings.unhighlight.call(this, t[e], this.settings.errorClass, this.settings.validClass);
                this.toHide = this.toHide.not(this.toShow),
                this.hideErrors(),
                this.addWrapper(this.toShow).show()
            },
            validElements: function() {
                return this.currentElements.not(this.invalidElements())
            },
            invalidElements: function() {
                return e(this.errorList).map(function() {
                    return this.element
                })
            },
            showLabel: function(t, n) {
                var i = this.errorsFor(t);
                i.length ? (i.removeClass(this.settings.validClass).addClass(this.settings.errorClass), i.html(n)) : (i = e("<" + this.settings.errorElement + ">").attr("for", this.idOrName(t)).addClass(this.settings.errorClass).html(n || ""), this.settings.wrapper && (i = i.hide().show().wrap("<" + this.settings.wrapper + "/>").parent()), this.labelContainer.append(i).length || (this.settings.errorPlacement ? this.settings.errorPlacement(i, e(t)) : i.insertAfter(t))),
                !n && this.settings.success && (i.text(""), "string" == typeof this.settings.success ? i.addClass(this.settings.success) : this.settings.success(i, t)),
                this.toShow = this.toShow.add(i)
            },
            errorsFor: function(t) {
                var n = this.idOrName(t);
                return this.errors().filter(function() {
                    return e(this).attr("for") === n
                })
            },
            idOrName: function(e) {
                return this.groups[e.name] || (this.checkable(e) ? e.name: e.id || e.name)
            },
            validationTargetFor: function(e) {
                return this.checkable(e) && (e = this.findByName(e.name).not(this.settings.ignore)[0]),
                e
            },
            checkable: function(e) {
                return /radio|checkbox/i.test(e.type)
            },
            findByName: function(t) {
                return e(this.currentForm).find("[name='" + t + "']")
            },
            getLength: function(t, n) {
                switch (n.nodeName.toLowerCase()) {
                case "select":
                    return e("option:selected", n).length;
                case "input":
                    if (this.checkable(n)) return this.findByName(n.name).filter(":checked").length
                }
                return t.length
            },
            depend: function(e, t) {
                return this.dependTypes[typeof e] ? this.dependTypes[typeof e](e, t) : !0
            },
            dependTypes: {
                "boolean": function(e) {
                    return e
                },
                string: function(t, n) {
                    return !! e(t, n.form).length
                },
                "function": function(e, t) {
                    return e(t)
                }
            },
            optional: function(t) {
                var n = this.elementValue(t);
                return ! e.validator.methods.required.call(this, n, t) && "dependency-mismatch"
            },
            startRequest: function(e) {
                this.pending[e.name] || (this.pendingRequest++, this.pending[e.name] = !0)
            },
            stopRequest: function(t, n) {
                this.pendingRequest--,
                this.pendingRequest < 0 && (this.pendingRequest = 0),
                delete this.pending[t.name],
                n && 0 === this.pendingRequest && this.formSubmitted && this.form() ? (e(this.currentForm).submit(), this.formSubmitted = !1) : !n && 0 === this.pendingRequest && this.formSubmitted && (e(this.currentForm).triggerHandler("invalid-form", [this]), this.formSubmitted = !1)
            },
            previousValue: function(t) {
                return e.data(t, "previousValue") || e.data(t, "previousValue", {
                    old: null,
                    valid: !0,
                    message: this.defaultMessage(t, "remote")
                })
            }
        },
        classRuleSettings: {
            required: {
                required: !0
            },
            email: {
                email: !0
            },
            url: {
                url: !0
            },
            date: {
                date: !0
            },
            dateISO: {
                dateISO: !0
            },
            number: {
                number: !0
            },
            digits: {
                digits: !0
            },
            creditcard: {
                creditcard: !0
            }
        },
        addClassRules: function(t, n) {
            t.constructor === String ? this.classRuleSettings[t] = n: e.extend(this.classRuleSettings, t)
        },
        classRules: function(t) {
            var n = {},
            i = e(t).attr("class");
            return i && e.each(i.split(" "),
            function() {
                this in e.validator.classRuleSettings && e.extend(n, e.validator.classRuleSettings[this])
            }),
            n
        },
        attributeRules: function(t) {
            var n = {},
            i = e(t),
            r = i[0].getAttribute("type");
            for (var o in e.validator.methods) {
                var s;
                "required" === o ? (s = i.get(0).getAttribute(o), "" === s && (s = !0), s = !!s) : s = i.attr(o),
                /min|max/.test(o) && (null === r || /number|range|text/.test(r)) && (s = Number(s)),
                s ? n[o] = s: r === o && "range" !== r && (n[o] = !0)
            }
            return n.maxlength && /-1|2147483647|524288/.test(n.maxlength) && delete n.maxlength,
            n
        },
        dataRules: function(t) {
            var n, i, r = {},
            o = e(t);
            for (n in e.validator.methods) i = o.data("rule-" + n.toLowerCase()),
            void 0 !== i && (r[n] = i);
            return r
        },
        staticRules: function(t) {
            var n = {},
            i = e.data(t.form, "validator");
            return i.settings.rules && (n = e.validator.normalizeRule(i.settings.rules[t.name]) || {}),
            n
        },
        normalizeRules: function(t, n) {
            return e.each(t,
            function(i, r) {
                if (r === !1) return void delete t[i];
                if (r.param || r.depends) {
                    var o = !0;
                    switch (typeof r.depends) {
                    case "string":
                        o = !!e(r.depends, n.form).length;
                        break;
                    case "function":
                        o = r.depends.call(n, n)
                    }
                    o ? t[i] = void 0 !== r.param ? r.param: !0 : delete t[i]
                }
            }),
            e.each(t,
            function(i, r) {
                t[i] = e.isFunction(r) ? r(n) : r
            }),
            e.each(["minlength", "maxlength"],
            function() {
                t[this] && (t[this] = Number(t[this]))
            }),
            e.each(["rangelength", "range"],
            function() {
                var n;
                t[this] && (e.isArray(t[this]) ? t[this] = [Number(t[this][0]), Number(t[this][1])] : "string" == typeof t[this] && (n = t[this].split(/[\s,]+/), t[this] = [Number(n[0]), Number(n[1])]))
            }),
            e.validator.autoCreateRanges && (t.min && t.max && (t.range = [t.min, t.max], delete t.min, delete t.max), t.minlength && t.maxlength && (t.rangelength = [t.minlength, t.maxlength], delete t.minlength, delete t.maxlength)),
            t
        },
        normalizeRule: function(t) {
            if ("string" == typeof t) {
                var n = {};
                e.each(t.split(/\s/),
                function() {
                    n[this] = !0
                }),
                t = n
            }
            return t
        },
        addMethod: function(t, n, i) {
            e.validator.methods[t] = n,
            e.validator.messages[t] = void 0 !== i ? i: e.validator.messages[t],
            n.length < 3 && e.validator.addClassRules(t, e.validator.normalizeRule(t))
        },
        methods: {
            required: function(t, n, i) {
                if (!this.depend(i, n)) return "dependency-mismatch";
                if ("select" === n.nodeName.toLowerCase()) {
                    var r = e(n).val();
                    return r && r.length > 0
                }
                return this.checkable(n) ? this.getLength(t, n) > 0 : e.trim(t).length > 0
            },
            email: function(e, t) {
                return this.optional(t) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(e)
            },
            url: function(e, t) {
                return this.optional(t) || /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(e)
            },
            date: function(e, t) {
                return this.optional(t) || !/Invalid|NaN/.test(new Date(e).toString())
            },
            dateISO: function(e, t) {
                return this.optional(t) || /^\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}$/.test(e)
            },
            number: function(e, t) {
                return this.optional(t) || /^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test(e)
            },
            digits: function(e, t) {
                return this.optional(t) || /^\d+$/.test(e)
            },
            creditcard: function(e, t) {
                if (this.optional(t)) return "dependency-mismatch";
                if (/[^0-9 \-]+/.test(e)) return ! 1;
                var n = 0,
                i = 0,
                r = !1;
                e = e.replace(/\D/g, "");
                for (var o = e.length - 1; o >= 0; o--) {
                    var s = e.charAt(o);
                    i = parseInt(s, 10),
                    r && (i *= 2) > 9 && (i -= 9),
                    n += i,
                    r = !r
                }
                return n % 10 === 0
            },
            minlength: function(t, n, i) {
                var r = e.isArray(t) ? t.length: this.getLength(e.trim(t), n);
                return this.optional(n) || r >= i
            },
            maxlength: function(t, n, i) {
                var r = e.isArray(t) ? t.length: this.getLength(e.trim(t), n);
                return this.optional(n) || i >= r
            },
            rangelength: function(t, n, i) {
                var r = e.isArray(t) ? t.length: this.getLength(e.trim(t), n);
                return this.optional(n) || r >= i[0] && r <= i[1]
            },
            min: function(e, t, n) {
                return this.optional(t) || e >= n
            },
            max: function(e, t, n) {
                return this.optional(t) || n >= e
            },
            range: function(e, t, n) {
                return this.optional(t) || e >= n[0] && e <= n[1]
            },
            equalTo: function(t, n, i) {
                var r = e(i);
                return this.settings.onfocusout && r.unbind(".validate-equalTo").bind("blur.validate-equalTo",
                function() {
                    e(n).valid()
                }),
                t === r.val()
            },
            remote: function(t, n, i) {
                if (this.optional(n)) return "dependency-mismatch";
                var r = this.previousValue(n);
                if (this.settings.messages[n.name] || (this.settings.messages[n.name] = {}), r.originalMessage = this.settings.messages[n.name].remote, this.settings.messages[n.name].remote = r.message, i = "string" == typeof i && {
                    url: i
                } || i, r.old === t) return r.valid;
                r.old = t;
                var o = this;
                this.startRequest(n);
                var s = {};
                return s[n.name] = t,
                e.ajax(e.extend(!0, {
                    url: i,
                    mode: "abort",
                    port: "validate" + n.name,
                    dataType: "json",
                    data: s,
                    success: function(i) {
                        o.settings.messages[n.name].remote = r.originalMessage;
                        var s = i === !0 || "true" === i;
                        if (s) {
                            var a = o.formSubmitted;
                            o.prepareElement(n),
                            o.formSubmitted = a,
                            o.successList.push(n),
                            delete o.invalid[n.name],
                            o.showErrors()
                        } else {
                            var u = {},
                            l = i || o.defaultMessage(n, "remote");
                            u[n.name] = r.message = e.isFunction(l) ? l(t) : l,
                            o.invalid[n.name] = !0,
                            o.showErrors(u)
                        }
                        r.valid = s,
                        o.stopRequest(n, s)
                    }
                },
                i)),
                "pending"
            }
        }
    }),
    e.format = e.validator.format
} (jQuery),
function(e) {
    var t = {};
    if (e.ajaxPrefilter) e.ajaxPrefilter(function(e, n, i) {
        var r = e.port;
        "abort" === e.mode && (t[r] && t[r].abort(), t[r] = i)
    });
    else {
        var n = e.ajax;
        e.ajax = function(i) {
            var r = ("mode" in i ? i: e.ajaxSettings).mode,
            o = ("port" in i ? i: e.ajaxSettings).port;
            return "abort" === r ? (t[o] && t[o].abort(), t[o] = n.apply(this, arguments), t[o]) : n.apply(this, arguments)
        }
    }
} (jQuery),
function(e) {
    e.extend(e.fn, {
        validateDelegate: function(t, n, i) {
            return this.bind(n,
            function(n) {
                var r = e(n.target);
                return r.is(t) ? i.apply(r, arguments) : void 0
            })
        }
    })
} (jQuery),
define("jquery.validate", ["jquery"],
function() {}),
function(e) {
    "function" == typeof define && define.amd ? define("jquery.cookie", ["jquery"], e) : e(jQuery)
} (function(e) {
    function t(e) {
        return a.raw ? e: encodeURIComponent(e)
    }
    function n(e) {
        return a.raw ? e: decodeURIComponent(e)
    }
    function i(e) {
        return t(a.json ? JSON.stringify(e) : String(e))
    }
    function r(e) {
        0 === e.indexOf('"') && (e = e.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, "\\"));
        try {
            e = decodeURIComponent(e.replace(s, " "))
        } catch(t) {
            return
        }
        try {
            return a.json ? JSON.parse(e) : e
        } catch(t) {}
    }
    function o(t, n) {
        var i = a.raw ? t: r(t);
        return e.isFunction(n) ? n(i) : i
    }
    var s = /\+/g,
    a = e.cookie = function(r, s, u) {
        if (void 0 !== s && !e.isFunction(s)) {
            if (u = e.extend({},
            a.defaults, u), "number" == typeof u.expires) {
                var l = u.expires,
                c = u.expires = new Date;
                c.setDate(c.getDate() + l)
            }
            return document.cookie = [t(r), "=", i(s), u.expires ? "; expires=" + u.expires.toUTCString() : "", u.path ? "; path=" + u.path: "", u.domain ? "; domain=" + u.domain: "", u.secure ? "; secure": ""].join("")
        }
        for (var d = r ? void 0 : {},
        h = document.cookie ? document.cookie.split("; ") : [], f = 0, p = h.length; p > f; f++) {
            var g = h[f].split("="),
            m = n(g.shift()),
            v = g.join("=");
            if (r && r === m) {
                d = o(v, s);
                break
            }
            r || void 0 === (v = o(v)) || (d[m] = v)
        }
        return d
    };
    a.defaults = {},
    e.removeCookie = function(t, n) {
        return void 0 !== e.cookie(t) ? (e.cookie(t, "", e.extend({},
        n, {
            expires: -1
        })), !0) : !1
    }
}),
require(["config"],
function() {
    require(["register_app", "text", "jquery", "underscore", "backbone", "marionette", "jquery.validate", "jquery.cookie"],
    function(e) {
        e.start()
    })
}),
define("register",
function() {});
//# sourceMappingURL=register.js.map
