import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('https://demo.playwright.dev/todomvc/#/');
  await page.getByPlaceholder('What needs to be done?').click();
  await page.getByPlaceholder('What needs to be done?').fill('create autotest');
  await page.getByPlaceholder('What needs to be done?').press('Enter');
  await page.getByRole('checkbox', { name: 'Toggle Todo' }).check();
  await page.getByRole('link', { name: 'Active' }).click();
  await page.getByRole('link', { name: 'Completed' }).click();
  await page.getByRole('listitem').filter({ hasText: 'All' }).click();
  await page.getByRole('link', { name: 'All' }).click();
  await page.getByTestId('todo-title').click();
  await page.getByRole('button', { name: 'Delete' }).click();
  await page.locator('html').click();
});
