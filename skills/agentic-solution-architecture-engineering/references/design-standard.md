# Design standard

Read before designing any interface, presenting a design, or building UI.

Two rules sit above everything here: **zero bugs, zero poor design.** Neither is aspirational. A visual defect is a defect, logged and fixed like a crash.

## Contents

- Presenting a design
- The zero-defect bar
- Layout hygiene
- Motion
- Not looking like every other AI app
- Semantic structure
- Adaptive and emotional modes
- Pre-ship critique

## Presenting a design

The plan phase has no gate. Keep moving without waiting for approval.

Do ask one thing: whether they like the design. Show it, do not describe it. A rendered mock, a styled HTML page, or a real component beats three paragraphs about palette and hierarchy every time.

Rules for presenting:

- **Visual first.** One image or one live view. A spec with bullet points does not count.
- **Simple.** One screen or one component per look. Four palette swatches and two type samples, not a full system dump.
- **Always add the drift note:** the final build may differ slightly once iteration begins. Designs tighten as real content, real data, and real edge cases arrive, say so up front so a small change later is expected rather than a surprise.
- **Ask once, keep going.** "Does this direction work?" then continue. Do not stall the build waiting for an answer.

## The zero-defect bar

Nothing ships with a known bug or a known visual flaw. If one is found and cannot be fixed immediately, it is written down and named, never quietly left.

Visual defects that count as bugs:

- Inconsistent or broken padding, anywhere
- Overlapping elements at any viewport width
- Content under a notch, home indicator, status bar, or keyboard
- Text clipped, truncated without intent, or wrapping into a shape nobody chose
- Tap targets under 44px
- Contrast below WCAG AA
- A state with no design: empty, loading, error, offline, long-name, zero-items, thousand-items
- Layout shift after load
- A control that does nothing, or gives no feedback that it did something

## Layout hygiene

**One spacing scale.** Pick one: 4 / 8 / 12 / 16 / 24 / 32 / 48. Never use a value outside it. Most padding trouble starts when someone types an arbitrary number into a single component.

**Padding is systematic, not per-element.** Same component type, same padding, every instance. Define it in a token, use the token.

**Safe areas are respected on every screen.** Use the platform's safe-area insets rather than guessing at fixed offsets. Test with a notch, with a home indicator, with the keyboard open, and in landscape.

**No overlap at any width.** Test at 320px, 768px, 1280px, and whatever the largest target is. Overlap usually means a fixed height or an absolute position that should have been flow layout.

**Optical alignment beats mathematical alignment.** Icons and text centered by measurement often read as off. Trust the eye and adjust.

**Touch targets at least 44×44px**, with spacing between adjacent ones. A visually small control can still have a large hit area.

## Motion

**No app ships without motion.** A static interface feels broken now. Motion earns its place by showing what changed.

Required:
- State transitions: open, close, expand, collapse, select
- Navigation between screens, with direction matching the mental model
- Loading states that show progress, not just a spinner on an empty screen
- Feedback on every action: press, submit, succeed, fail

Craft:
- 150 to 250ms for most transitions. Under 100ms is invisible; over 400ms feels slow and people start tapping twice.
- Ease-out for things entering, ease-in for things leaving.
- Animate transform and opacity. Animating width, height, top, or left causes layout recalculation and drops frames.
- One thing moves at a time unless a group genuinely moves together.
- Honor `prefers-reduced-motion`: swap movement for a cross-fade, never remove the feedback entirely.

Restraint still applies. Motion answering a user's action is always welcome. Ambient motion that nobody triggered, fade-and-slide on every section as it scrolls into view, a hover lift on every card, is the generated-page default and reads as such. Spend one orchestrated moment well instead of scattering effects.

## Not looking like every other AI app

Generated interfaces have converged on a recognizable look. Avoid it deliberately.

**The current tells:**
- Unmodified component-library defaults: stock shadcn, stock Material, stock Bootstrap, straight out of the box
- Everything chopped into identical rounded cards with the same radius and the same soft grey shadow
- Purple-to-blue gradients, or a warm cream background with a serif display and a terracotta accent
- All-caps tracked-out eyebrow labels above every heading
- A single accented word in a headline
- Arrows appended to every button and link
- Meta strings joined with middle dots
- Numbered markers (01 / 02 / 03) on content that is not a sequence
- Emoji standing in for icons
- Centered hero, three feature cards, testimonial row, footer

**Instead:**
- Draw the visual direction from the subject matter. A tool for machinists and a tool for florists should be unmistakably different. Industry, materials, and vocabulary are where distinctive choices come from.
- Choose typefaces deliberately: one family, or two that are clearly distinct. Set a real type scale with intentional weights and spacing. Type carries the personality.
- Make structural devices carry information. A border, a divider, a number means something, or it comes out.
- Restyle every library component. A library gives you behavior that is accessible, keyboard correct and tested. It does not give you a look. Keep the behavior. Replace the skin.
- Spend boldness in one place. One memorable element, everything around it disciplined and quiet.

**No weird buttons.** A button looks tappable, says exactly what it does in active voice, and keeps that name through the flow, "Publish" leads to "Published". Consistent height, consistent radius, consistent weight across the app. No mystery-meat icons without labels, no inventing a novel control where a standard one works.

## Semantic structure

Machines read these interfaces too, assistants and search agents parse the markup before a person ever sees the page. Messy structure means being misread or left out entirely.

- Semantic HTML, real heading hierarchy, labels tied to inputs.
- Design tokens named for role, not value: `surface-raised`, `text-muted`, `action-primary`, never `blue-500`. Role names survive a palette change and tell both a machine and a new developer what the token is for.
- Document each component's purpose and when to use it, not just how it looks. Put it in `.info/DEVELOPER.md`, and the component's symbol in `.info/CLASSES.md`.

## Adaptive and emotional modes

Optional, but worth proposing when the product is used across a day or across contexts.

- Light and dark are the floor, not the ceiling. Consider warmer tones and slower transitions at night, higher energy in the morning.
- Adapt to context: focus versus browsing, one-handed versus desk, noisy versus quiet.
- Always leave manual control. Automatic adaptation that cannot be overridden is a bug, not a feature.
- Be transparent about any sensing involved.

If using translucent or glass surfaces: hold text contrast at AA against the actual background in motion, ship an opacity or transparency control, and test over real content in both themes. Blur over a busy background is the fastest way to fail legibility.

## Screens with no data yet

A screen built before its data source exists renders the empty state. It does not render invented rows to look finished.

This is not a compromise. The empty state is the first thing a real user sees, it is the state most often skipped, and building it first means it gets designed rather than bolted on. Write the copy as an invitation to act, name what will appear here, and give the person the button that puts the first record in.

## Pre-ship critique

Before calling any screen done:

1. Screenshot it. Look at the picture, not the code.
2. Check every state: empty, loading, error, long content, no content, slow network. Check them with the real store connected and genuinely empty, not with sample rows.
3. Resize to the smallest and largest targets. Check overlap and padding at both.
4. Tab through it. Focus visible at every stop?
5. Turn on reduced motion. Still usable, still gives feedback?
6. Ask the calibration question: would this be recognizable as a generated interface? If yes, name which tell and remove it.
7. Remove one thing. The design is usually better for it.
