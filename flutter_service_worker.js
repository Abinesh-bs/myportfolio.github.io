'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "2e16a6de01d86d94501638981f9b53d1",
".git/config": "e92f1150cdc7096baafc61034371d8c8",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "63fa486df64184721f5e388d3d1a492a",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "153690a85ce0d3cb2d8b588895ce2364",
".git/logs/refs/heads/main": "a2fbd0adb9db4fa1e0edf83505c3ea94",
".git/logs/refs/remotes/origin/main": "1227e76dfb7f9b0ac6f5fb8bdf100747",
".git/objects/00/182c9794a6f94e1213df81d7d1fcdfcba4a617": "2e2c55d7420e799f254b0aff5afcc219",
".git/objects/0a/1c3ae62f1880330610ecd9879bdc7a6d0f3576": "998050ea0aa88d30ec144e430f4a6022",
".git/objects/1c/abd33157a4c31aa2247c58a0227dd68d3bf224": "fa511220de1acfda5de3f177bd2e2db7",
".git/objects/1d/468b85698a60041b450286f31b3264b3bbd6f7": "5c8c497111befde32ac151f14cf92f85",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/28/8cb9e6ccfd58b8f4b6dd34f02f797fdb988c98": "636cd190df99095d8913ea13e5505722",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/3b/e81aefe670ba4044237cab34d6ddccfcd3f60b": "dc69dd44d6b410992512fbb46cb589a9",
".git/objects/3e/30e31d057f44edd519700a307f6357345aa586": "13a63a6e83ddeae0d62c804fb284c04d",
".git/objects/40/02156deaa8cc70ee9b9a6f145e50d607e91d1e": "5bfd3f212e438484cf6aa0365a748b41",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/41/09e48611daad868c51a595136f8fdf14fc06c7": "35822d002c1c4c444768831203682f5f",
".git/objects/45/90a6f8c7df9514e0f3eb01268fb2b04442c036": "4f10eefe7d50aee4971db344b3d366d5",
".git/objects/48/6ec3414658b46ef6c7944ffaf387c1ed0f93b3": "463a35c99892037b1283fe9120edf0a3",
".git/objects/4c/d2daee4b444ab5e4d5b55e384800efce77709c": "b5c71b6138681ba943ec4a64736be819",
".git/objects/52/896f461139823daf687cc35421b4042e303fbc": "63a42eee682858c78a1735754a5479b4",
".git/objects/52/de21aaa3004ece1203aa2ac0c56693b1aff320": "e0d16a009e4d6391c0661353d533ca8f",
".git/objects/53/3402c75429e6feaa7b8f92878ae2313dbdf2de": "63ab067b0b447b461fa3e8f58a1f23a9",
".git/objects/56/cbb5c11c7373e7f7c54fb680e073dcd5f408f7": "ff950c11ec52d8a92d12e3b0773249f5",
".git/objects/56/fe7f06604095091ab37495cd06a7c9e7a4d8be": "a53f7d5c60051c0689ba2c681a9d634a",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/5e/2fe10a4bde5b4c223784ae9bd398f60f8157d3": "14ea325a7fe52bfaeb9caed664af80a5",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/66/6410534ca7b4a42e0c8d1a96e012496225bb67": "c5857f9fa1704b2f7f3da68fd4e475c8",
".git/objects/69/43568535ee712a0eb5061ec5d24f0de8f5f310": "384049c68d59175260912da78a44489c",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/72/3d030bc89a4250e63d16b082affe1998618c3f": "e4299c419434fc51f64a5266659918fa",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8f/c8be62f202c40e7d3e2e16242fb065cfc4e1a7": "6fda1b80da67a8d96186cf8ab8b24087",
".git/objects/8f/de87b69ff85b747a072cafd5f3bd9a2b8ee547": "225f6f15f0d8c03bb432e5190ad2cd9d",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/98/2bbd1e95b01d72d736586ae8aa01e736fceac2": "0e9f855b24ad321e3e45df2ad1fcd179",
".git/objects/a2/75491c8bc1238f4017f82f40af12a533f14b5c": "4a7a28c9b975746044c4cf6b95b5ed02",
".git/objects/a3/f2804372d58f6fb0a5e4a67571aad8ef1a656b": "9acc0c468eea13b1d46a7b5ed371bf87",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/a7/721a3781d46d5096022c3a78a1714515a6d8fd": "a1daf7d62b9f38fb8683ef1cb8bc372f",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/a9/793b5a7a10dd65a98b8b2e235eb3ce3633e44d": "0fafb521b28e6472f08e34613738095a",
".git/objects/ac/2147fdf4626566419ba5325c765e2eedc86110": "b3fbb9e54b1ed7cc5c7fe2d9a89d4bbd",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/0efadfd3b29e71449fe720b0d503d3a71e78fc": "1e1acdc2ff3aebde051a6ce6c0c9315c",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c0/1a0b2e66e752edd44540edf58cb2e23daae547": "aa566013c18b36d8bb9babda4d8e75c2",
".git/objects/c4/0da0fc2e284cabfe9230b1e9fb73b488575970": "21b0d390e9abfd4c917f71322353ea8a",
".git/objects/ca/84708b75c335609d5d30c458fee1ea4b71dfce": "b87592e7e99e3316e1c10e463869c01c",
".git/objects/ce/90d0b598f7e53aaae919abcc6cd8c39822f95a": "eb0961b56255e03865e5b41178a93adb",
".git/objects/ce/e3c5bb4ad9ca1b7e02e3391cc1cbba998308b7": "8e23cc0d8eea61c17a30b19ec3ccb417",
".git/objects/cf/8efe04fd46e652c790411e4490881947a177b0": "540551a2020e10493ba5f23b1cd4c86e",
".git/objects/d4/0a57440177f17137aad1ebd1fc48e52f60013a": "69e02f4a36f0df9a84a4471e95502f13",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/e4/b1fadf03b8bd6593cfff8e6e49cc1461d82f9b": "532addc4580ee62f7e8e0541b26b175f",
".git/objects/e6/549eab794d26306a6323c4544f76c8d0944943": "6b08fbff5a36f55f5d5d2f5257a08ddf",
".git/objects/e6/f02f4c8fb2471b109a65f306bbd9469470a7a4": "d0a2057184aa0161cc5daba296f34e56",
".git/objects/e7/1bbd0173a4faadabf832a9d31ce4ef8f061717": "93c9b5734de77dd26e532cce8978ae40",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ee/8b72f51015219cecd5478a024d9511be2fc18d": "25d1fb7a0403804df9cd7dac17f434c5",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/9956355a59cdb85f41369ff272e3bfd79c77ef": "9f79a603f66e0d9ab20be8ab9978004f",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/refs/heads/main": "ca3bee5eb8b01f60e677e242b76367c7",
".git/refs/remotes/origin/main": "ca3bee5eb8b01f60e677e242b76367c7",
"assets/AssetManifest.bin": "09be14c4e95fff4b4faa6250a91c597b",
"assets/AssetManifest.bin.json": "27657dab0a3d87a3dcf7262117aaeb66",
"assets/AssetManifest.json": "326dd5837b17a974aca256d27f40e38e",
"assets/assets/images/ABINESH%2520RESUME.pdf": "3c6e2ee5d09dc9f476052e5902c3fbbe",
"assets/assets/images/cloud-api.svg": "2689989cec573d4815d10ceeb5e0e731",
"assets/assets/images/dart.png": "ae62b92f13758a541600d0790a3609ec",
"assets/assets/images/experience_cert.jpeg": "bf559e03d191a89ed812065433635a97",
"assets/assets/images/firebase.svg": "4b89c6c65208212d0d0f227db2427cc3",
"assets/assets/images/graphql.svg": "64a6f67f424aaf1fc017677118bbfb29",
"assets/assets/images/management.svg": "92d04538ce64a3e68be33609228bf918",
"assets/assets/images/profile.jpg": "d7474d99ea6d6378989ae0acc78af956",
"assets/assets/images/sqllite.svg": "f3a0bdd8278e6e5c74bccbdc09e7aa4e",
"assets/assets/images/user-interface.svg": "01e07d4882070b975514e1f4d7256210",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "693a376fe70e39982e0875391a305e4c",
"assets/NOTICES": "7406bb7d569316c65b628649d9a8d761",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "c8955389283c13d8d3db2e290ede2c62",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "2ef2ba56a87eac02ebaec48196dadd4a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6e83a5fbf065e7eda88f32c32d15f476",
"/": "6e83a5fbf065e7eda88f32c32d15f476",
"main.dart.js": "3d27f6a02884330bfa4456268628c443",
"manifest.json": "d8fe34f7ae4c072a77b924e01dac8a50",
"version.json": "9b818ca9511483c901bed1545384376c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
