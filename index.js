const {BrowserWindow, app} = require("electron");
const pie = require("puppeteer-in-electron")
const puppeteer = require("puppeteer-core");

const main = async () => {
  await pie.initialize(app);
  const browser = await pie.connect(app, puppeteer);

  const window = new BrowserWindow();
  const url = "https://google.com/";
  await window.loadURL(url);

  const page = await pie.getPage(browser, window);
  console.log(page.url());

  // 検索用のinputに文字を検索したいテキストを入力
  await page.type('input[title="検索"]', "Puppeteer", { delay: 50 });

  //　検索ボタンをクリック
  await page.evaluate(() => {
    document.querySelector('input[value^="Google"]').click();
  });

  // ページ遷移を待つ
  await page.waitForNavigation({timeout: 600000, waitUntil: "domcontentloaded"});

  console.log('検索結果がブラウザに表示されました。');

  // window.destroy();
};

main();

